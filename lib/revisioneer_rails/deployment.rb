require "json"
require "typhoeus"

module RevisioneerRails
  class Deployment < Struct.new(:sha, :messages)
    def self.load page = 1, limit = 20
      url = ::RevisioneerRails.config.url + "/deployments"
      request = Typhoeus::Request.new(
        url,
        method: :get,
        headers: { "API-TOKEN" => ::RevisioneerRails.config.api_token }
      )
      response = request.run
      json = ::JSON.parse response.body

      json.map { |deploy_data|
        self.new(deploy_data[:sha], deploy_data[:messages])
      }
    end
  end
end