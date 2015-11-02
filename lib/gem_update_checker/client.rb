module GemUpdateChecker
  class Client

    attr_reader :latest_version, :gem_name, :current_version, :update_available
    RUBYGEMS_API = "https://rubygems.org/api/v1/versions"

    def initialize(gem_name, current_vesion)
      @gem_name = gem_name
      @current_version = current_vesion

      uri = URI("#{RUBYGEMS_API}/#{@gem_name}/latest.json")
      respose = Net::HTTP.get_response uri
      json = JSON.parse(respose.body)

      @latest_version = json["version"]
      @update_available = @latest_version && Gem::Version.new(@latest_version) > Gem::Version.new(@current_version)
    end
  end
end
