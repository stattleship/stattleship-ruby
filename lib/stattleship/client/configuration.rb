module Stattleship
  class << self
    attr_accessor :configuration

    def configure
      if block_given?
        yield configuration
      end

      configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end

  class Configuration
    attr_accessor :api_token
    attr_reader :http
    attr_writer :base_uri

    def api_token=(token)
      @api_token = token
    end

    def api_token
      @api_token || ENV['STATTLESHIP_ACCESS_TOKEN']
    end

    def base_uri
      @base_uri ||= URI('https://www.stattleship.com')
    end

    def http
      Net::HTTP.new(base_uri.host, base_uri.port).tap do |http|
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end
    end
  end
end
