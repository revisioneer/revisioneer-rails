# RevisioneerRails

A Rails engine to easily display deployment informations gathered by [revisioneer][1].
In order to use it you first need to have an account for it.

To add deployments to revisioneer you need to integrate it into your deployment process.

If you are using mina to power your deployments you might want to take a look at [mina-revisioneer][2] to automatically push informations to revisioneer.

## Installation

Add this line to your application's Gemfile:

``` ruby
# Gemfile
gem "revisioneer_rails"
```

### Generator
run:

``` ruby
rails generate revisioneer *your-api-token*
```

### Manuel

Next mount the engine to wherever you want the revisions to be displayed:

``` ruby
# routes.rb
mount RevisioneerRails::Engine => "/revisions"
```

You need to add your revisioneer credentials to to a configuration file not under version control:

``` yaml
development: &dev
  endpoint: "https://revisions.deployed.eu"
  api_token: "your api token"

production:
  <<: *dev
```

and write an initializer which loads the configuration:

``` ruby
# config/initializers/revisioneer.rb
obj = YAML.load_file(Rails.root.join("config", "revisioneer.yml"))[Rails.env]

RevisioneerRails.configure do |config|
  config.url = obj["endpoint"]
  config.api_token = obj["api_token"]
end unless obj.empty?
```

Lastly, restart your application server

## Views

You can generate the views for the revisions page with:

```
rails generate revisioneer:views
```

It generates the views under ```app/views/revisioneer_rails/revisions```


## TODO

- add tests for the revisioneer client

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[1]:https://github.com/nicolai86/revisioneer
[2]:https://github.com/nicolai86/mina-revisioneer
