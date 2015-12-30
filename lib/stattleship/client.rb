module Stattleship
  class Client
    def initialize(path:, query: nil, token: Stattleship.configuration.api_token)
      @base_uri = Stattleship.configuration.base_uri.freeze
      @path = path
      @query = query
      @token = token || ENV['STATTLESHIP_ACCESS_TOKEN']
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

    attr_reader :base_uri, :path, :query, :token

    def url
      if query
        template = Addressable::Template.new("#{base_uri}/#{path}/{?query*}")
        template.partial_expand(query).pattern
      else
        "#{base_uri}/#{path}"
      end
    end

    def endpoint
      @endpoint ||= Net::HTTP::Get.new(url, headers)
    end
  end
end
