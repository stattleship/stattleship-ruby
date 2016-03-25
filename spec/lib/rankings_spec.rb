require 'spec_helper'

module Stattleship
  RSpec.describe Rankings do
    describe '#rankings' do
      it 'returns all the rankings' do
        expect(rankings.count).to eq 5
      end

      it 'populates rankings' do
        rankings.each do |ranking|
          pp ranking.player_name
          pp ranking.season_name
          pp ranking.team_name
          pp ranking.place
          pp ranking.ordinal_place
        end
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch rankings' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/rankings/basketball_season_player_performance_ranking.json'))

        Rankings.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/rankings?ranking=basketball_season_player_performance_ranking&place=5")
        ).to have_been_made.once
      end

      it 'parses and builds the Baseball game logs' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/rankings/basketball_season_player_performance_ranking.json'))

        rankings = Rankings.fetch(params: params)

        rankings.each do |ranking|
          expect(ranking).to be_a Stattleship::Models::Ranking
        end
      end

      def params
        Stattleship::Params::RankingsParams.new.tap do |params|
          params.place = 5
          params.ranking = 'basketball_season_player_performance_ranking'
        end
      end
    end
  end
end
