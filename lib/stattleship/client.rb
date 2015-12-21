module Stattleship
  class Client
    def initialize(path:, token: Stattleship.configuration.api_token)
      @base_uri = Stattleship.configuration.base_uri.freeze
      @path = path
      @token = token
    end

    def headers
      {
        'Accept' => 'application/vnd.stattleship.com; version=1',
        'Authorization' => "Token token=#{token}",
        'Content-Type' => 'application/json',
        'User-Agent' => "Stattleship Ruby/#{Stattleship::Ruby::VERSION} (#{RUBY_PLATFORM})"
      }
    end

    def fetch
      Stattleship.configuration.http.request(endpoint)
      rescue StandardError => e
        puts "HTTP Request failed (#{e.message})"
    end

    private

    attr_reader :base_uri, :path, :token

    def endpoint
      @endpoint ||= Net::HTTP::Get.new("#{base_uri}/#{path}", headers)
    end
  end
end
