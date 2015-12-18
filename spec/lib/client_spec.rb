require 'spec_helper'

RSpec.describe Stattleship::Client do
  before(:each) do
    Stattleship.configure do |config|
      config.api_token = 'abc123'
    end
  end

  describe '#headers' do
    it 'returns all the header values for Net::HTTP' do
      client = Stattleship::Client.new(path: 'hockey/nhl/teams')

      expect(client.headers).to eq(headers)
    end
  end

  describe '#fetch' do
    it 'makes a request to Stattleship with headers' do
      client = Stattleship::Client.new(path: 'hockey/nhl/game_logs')
      stub_request(:get, /https:\/\/stattleship.com.*/)

      client.fetch

      expect(
        a_request(:get, /https:\/\/stattleship.com.*/).
        with(headers: headers)
      ).to have_been_made.once
    end

    it 'makes a request to Stattleship at a specified url' do
      path = 'hockey/nhl/game_logs'
      client = Stattleship::Client.new(path: path)
      stub_request(:get, /https:\/\/stattleship.com.*/)

      client.fetch

      expect(
        a_request(:get, "https://stattleship.com/#{path}")
      ).to have_been_made.once
    end
  end

  def headers
    version = Stattleship::Ruby::VERSION
    {
      'Accept' => 'application/vnd.stattleship.com; version=1',
      'Content-Type' => 'application/json',
      'Authorization' => 'Token token=abc123',
      'User-Agent' => "Stattleship Ruby/#{version} (#{RUBY_PLATFORM})"
    }
  end
end
