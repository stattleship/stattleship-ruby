require 'spec_helper'

module Stattleship
  RSpec.describe Client do
    before(:each) do
      Stattleship.configure do |config|
        config.api_token = 'abc123'
      end
    end

    describe '#headers' do
      it 'returns all the header values for Net::HTTP' do
        client = Client.new(path: 'hockey/nhl/teams')

        expect(client.headers).to eq(headers)
      end
    end

    describe '#fetch' do
      it 'makes a request to Stattleship with headers' do
        client = Client.new(path: 'hockey/nhl/game_logs')
        stub_request(:get, /#{base_api_url}.*/)

        client.fetch

        expect(
          a_request(:get, /#{base_api_url}.*/).
          with(headers: headers)
        ).to have_been_made.once
      end

      it 'makes a request to Stattleship at a specified url' do
        path = 'hockey/nhl/game_logs'
        client = Stattleship::Client.new(path: path)
        stub_request(:get, /#{base_api_url}.*/)

        client.fetch

        expect(
          a_request(:get, "#{base_api_url}/#{path}")
        ).to have_been_made.once
      end
    end

    describe '#paginate' do
      it 'traverses the paginated response' do
        path = 'basketball/nba/game_logs?team_id=nba-cle'
        client = Stattleship::Client.new(path: path)
        url = "#{base_api_url}/#{path}"
        next_url = 'https://www.stattleship.com/basketball/nba/game_logs?team_id=nba-cle&page=2&per_page=40'

        response_headers = { 'Link' => '<https://www.stattleship.com/basketball/nba/game_logs?team_id=nba-cle&page=1&per_page=40>; rel="first", <https://www.stattleship.com/basketball/nba/game_logs?team_id=nba-cle&page=2&per_page=40>; rel="prev", <https://www.stattleship.com/basketball/nba/game_logs?team_id=nba-cle&page=2&per_page=40>; rel="last", <https://www.stattleship.com/basketball/nba/game_logs?team_id=nba-cle&page=2&per_page=40>; rel="next"' }

        stub_request(:get, url).
          to_return(body: File.read('spec/fixtures/nba/game_log.json'),
                    headers: response_headers)

        response_headers = { 'Link' => '<https://www.stattleship.com/basketball/nba/game_logs?team_id=nba-cle&page=1&per_page=40>; rel="first", <https://www.stattleship.com/basketball/nba/game_logs?team_id=nba-cle&page=1&per_page=40>; rel="prev", <https://www.stattleship.com/basketball/nba/game_logs?team_id=nba-cle&page=2&per_page=40>; rel="last"' }

        stub_request(:get, next_url).
          to_return(body: File.read('spec/fixtures/nba/game_log_page_2.json'),
                    headers: response_headers)

        client.paginate(model: Stattleship::BasketballGameLogs)

        expect(
          a_request(:get,
                    url)
        ).to have_been_made.once

        expect(
          a_request(:get,
                    next_url)
        ).to have_been_made.once
      end
    end

    def headers
      version = Stattleship::Ruby::VERSION
      {
        'Accept' => 'application/vnd.stattleship.com; version=1',
        'Content-Type' => 'application/json',
        'Authorization' => 'Token token=abc123',
        'User-Agent' => "StattleshipRuby/#{version} (#{RUBY_PLATFORM})"
      }
    end
  end
end
