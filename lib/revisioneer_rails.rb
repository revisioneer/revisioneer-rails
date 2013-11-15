require "revisioneer_rails/deployment"
require "revisioneer_rails/engine"
require "revisioneer_rails/version"

module RevisioneerRails
  Config = Struct.new(:url, :api_token)

  def self.config
    @@config
  end

  def self.configure
    @@config = Config.new
    yield @@config if block_given?
    @@config
  end
end
