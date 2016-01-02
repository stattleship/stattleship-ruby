module Stattleship
  class Client
    def initialize(path:,
                   query: nil,
                   token: Stattleship.configuration.api_token)
      @base_uri = Stattleship.configuration.base_uri.freeze
      @path = path
      @query = query
      @token = token
    end

    def headers
      {
        'Accept' => 'application/vnd.stattleship.com; version=1',
        'Authorization' => "Token token=#{token}",
        'Content-Type' => 'application/json',
        'User-Agent' =>
          "Stattleship Ruby/#{Stattleship::Ruby::VERSION} (#{RUBY_PLATFORM})"
      }
    end

    def fetch
      Stattleship.configuration.http.request(endpoint)
    rescue StandardError => e
      puts "HTTP Request failed (#{e.message})"
      raise e
    end

    def paginate(model:)
      data = []
      response = fetch

      while keep_fetching?(response: response)
        data << build(model: model, response: response)

        if next_url(response: response)
          response = fetch_next_url
        end
      end

      data.flatten
    end

    private

    attr_reader :base_uri, :path, :query, :token

    def build(model:, response:)
      builder = model.new
      builder.extend(Kernel.const_get("#{builder.class.name}Representer"))
      builder.from_json(response.body).data
    end

    def keep_fetching?(response:)
      response.is_a?(Net::HTTPSuccess) && @url
    end

    def fetch_next_url
      sleep(0.25)

      response = fetch

      unless response.is_a?(Net::HTTPSuccess)
        @url = nil
      end

      response
    end

    def next_url(response:)
      @url = nil

      headers = response.header.to_hash
      links = (headers['link'] || []).first

      LinkHeader.parse(links).links.map do |link|
        if link.attrs['rel'] == 'next'
          @url = link.href
          return true
        end
      end

      false
    end

    def url
      @url ||= begin
        if query
          template = Addressable::Template.new("#{base_uri}/#{path}{?query*}")
          template.partial_expand(query).pattern
        else
          "#{base_uri}/#{path}"
        end
      end
    end

    def endpoint
      Net::HTTP::Get.new(url, headers)
    end
  end
end
