# Decidim::Ldap

A decidim package to provide user authentication via LDAP. Once is active for an organization,
it is imposible to signup.

The plugin adds a new tab in the Decidim System admin panel that allows to create LDAP configurations
for every organization. Different config parameters can be configured for every organization.

## Installation

~~Add this line to your application's Gemfile:~~

```ruby
gem 'decidim-ldap'
```

Meanwhile this Gem [is not published in rubygems.org](https://rubygems.org/search?utf8=%E2%9C%93&query=decidim), to import this Gem add those lines in the Gemfile:
```ruby
git 'https://github.com/diputacioBCN/decidim-diba.git' do
  gem 'decidim-ldap'
end
```

And then execute:

```bash
bundle
bin/rails decidim_ldap:install:migrations
bin/rails db:migrate
```

## Configuration

Once installed, you need to configure the LDAP user credentials that will be used
to perform the ldap binding. Create a file called `config/initializers/ldap.rb` with this content:

```ruby
Decidim::Ldap.configure do |config|
  config.ldap_username = Rails.application.secrets.ldap[:username]
  config.ldap_password = Rails.application.secrets.ldap[:password]
end
```

Add the following lines in the file `config/secrets.yml`:

```yaml
default: &default
...
  ldap:
    username: <%= ENV["LDAP_USERNAME"] %>
    password: <%= ENV["LDAP_PASSWORD"] %>
```

And define those environment variables through a gem like `figaro` (in `config/application.yml`) or through docker-compose `env_file`.

## Changes in pirates-cat/decidim-diba

This [repository](https://github.com/pirates-cat/decidim-diba) is a clean fork of [diputacioBCN/decidim-diba](https://github.com/diputacioBCN/decidim-diba), with only 6 uncommented lines in `decidim-ldap/lib/decidim/ldap/engine.rb` file.

## License

AGPLv3 (same as Decidim)
