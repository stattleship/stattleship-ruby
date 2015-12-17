require 'spec_helper'

RSpec.describe Stattleship::Client do
  describe 'constants' do
    it 'defines BASE_API_URI' do
      uri = URI('https://stattleship.com')

      expect(Stattleship::Client::BASE_API_URI).to eq(uri)
    end
  end

  describe '#headers' do
    it 'returns all the header values for Net::HTTP' do
      client = Stattleship::Client.new(path: 'hockey/nhl/teams',
                                       token: 'abc123')
      version = Stattleship::Ruby::VERSION
      headers = {
        'Accept' => 'application/vnd.stattleship.com; version=1',
        'Content-Type' => 'application/json',
        'Authorization' => 'Token token=abc123',
        'User-Agent' => "Stattleship Ruby/#{version} (#{RUBY_PLATFORM})"
      }

      expect(client.headers).to eq(headers)
    end
  end

  describe '#fetch' do
    it 'makes a request to Stattleship with headers' do
      client = Stattleship::Client.new(path: 'hockey/nhl/game_logs',
                                       token: 'abc123')
      stub_request(:get, /https:\/\/stattleship.com.*/)
      version = Stattleship::Ruby::VERSION

      client.fetch

      headers = {
        'Accept' => 'application/vnd.stattleship.com; version=1',
        'Content-Type' => 'application/json',
        'Authorization' => 'Token token=abc123',
        'User-Agent' => "Stattleship Ruby/#{version} (#{RUBY_PLATFORM})"
      }

      expect(
        a_request(:get, /https:\/\/stattleship.com.*/).
        with(headers: headers)
      ).to have_been_made.once
    end

    it 'makes a request to Stattleship at a specified url' do
      path = 'hockey/nhl/game_logs'
      client = Stattleship::Client.new(path: path, token: 'abc123')
      stub_request(:get, /https:\/\/stattleship.com.*/)

      client.fetch

      expect(
        a_request(:get, "https://stattleship.com/#{path}")
      ).to have_been_made.once
    end
  end
end
