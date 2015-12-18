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
    attr_writer :base_uri

    def base_uri
      @base_uri ||= URI('https://stattleship.com')
    end
  end
end
