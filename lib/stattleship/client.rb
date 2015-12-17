module Stattleship
  class Client
    BASE_API_URI = URI('https://stattleship.com').freeze

    def initialize(path:, token:)
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
      configure_http

      begin
        http.request(endpoint)
      rescue StandardError => e
        puts "HTTP Request failed (#{e.message})"
      end
    end

    private

    attr_reader :path, :token

    def http
      @http ||= Net::HTTP.new(BASE_API_URI.host, BASE_API_URI.port)
    end

    def configure_http
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    end

    def endpoint
      @endpoint ||= Net::HTTP::Get.new("#{BASE_API_URI}/#{path}", headers)
    end
  end
end
