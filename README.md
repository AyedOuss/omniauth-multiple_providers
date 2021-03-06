# Omniauth::MultipleProviders

Support for Omniauth and Multiple Providers.

## Dependency

### Devise

Omniauth::MultipleProviders requires `User` model and `current_user` helper,  like Devise.
You should create User model, before `rails g omniauth:multiple_providers:install`.
ex) do `rails g devise User`

### Omniauth and Omniauth Strategy

You should setup Omniauth configuration, before `rails g omniauth:multiple_providers:install`.
ex) create config/initializers/omniauth.rb file.

``` ruby
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook' # etc you needs
gem 'omniauth-twitter'  # etc you needs
```

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'omniauth'
gem 'omniauth-facebook' # etc you needs
# ...
gem 'omniauth-multiple_providers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-multiple_providers

## Usage

`app/models/user.rb` (generated by Devise) do not use `:omniauthable`.

``` ruby
# app/models/user.rb
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable # <= do not use
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # ...
end
```

``` sh
$ rails generate omniauth:multiple_providers:install
$ rake db:migrate # => create provider_users table
```

You can use `new_omniauth_path(provider: :provider_name)`, and It redirect_to `/auth/:provider_name`.
And automatically receive callback, and Save to `ProviderUser`(app/models/provider_user.rb).

``` haml
%ul
  %li
    = link_to new_omniauth_path(provider: :twitter) do
      Signup with Twitter
  %li
    = link_to new_omniauth_path(provider: :facebook) do
      Signup with Facebook
  %li
    = link_to new_omniauth_path(provider: :github) do
      Signup with Github
```

And if you remove connection to Providers,

``` ruby
= link_to omniauth_path(:twitter), method: :delete do
  cancel connection
```

## TODO

- Drop Dependency of Devise
- Configuratable with initializer

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
