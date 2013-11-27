# config/initializers/revisioneer.rb
obj = YAML.load_file(Rails.root.join("config", "revisioneer.yml"))[Rails.env]

RevisioneerRails.configure do |config|
  config.url = obj["endpoint"]
  config.api_token = obj["api_token"]
end unless obj.empty?
