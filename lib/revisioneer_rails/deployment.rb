require "json"
require "typhoeus"

module RevisioneerRails
  class Deployment < Struct.new(:sha, :messages)
    def self.load page = 1, limit = 20
      url = ::RevisioneerRails.config.url + "/deployments"
      response = ::Typhoeus.get(url, header: { "API-TOKEN" => ::RevisioneerRails.config.api_token })
      json = ::JSON.parse response.body

      json.map { |deploy_data|
        self.new(deploy_data[:sha], deploy_data[:messages])
      }
    end
  end
end