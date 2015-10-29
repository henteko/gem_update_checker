require "net/http"
require "json"

module GemUpdateChecker
  RUBYGEMS_API = "https://rubygems.org/api/v1/versions"

  class << self
    def update_available?(gem_name, current_version)
      uri = URI("#{RUBYGEMS_API}/#{gem_name}/latest.json")
      respose = Net::HTTP.get_response uri
      json = JSON.parse(respose.body)

      latest_version = json["version"]
      latest_version && Gem::Version.new(latest_version) > Gem::Version.new(current_version)
    end
  end
end

require "gem_update_checker/version"
