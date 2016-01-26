require 'spec_helper'

module Stattleship
  RSpec.describe HockeyScoringPlays do
    describe '#scoring_plays' do
      it 'returns all the nhl_scoring_plays' do
        expect(nhl_scoring_plays.count).to eq 5
      end

      it 'populates the scoring_play' do
        nhl_scoring_plays.each do |scoring_play|
          expect(scoring_play).to be_a Models::ScoringPlay
          expect(scoring_play.game).to be_a Models::Game
          expect(scoring_play.league).to be_a Models::League
          expect(scoring_play.team).to be_a Models::Team

          expect(scoring_play.away_team).to be_a Models::Team
          expect(scoring_play.home_team).to be_a Models::Team
          expect(scoring_play.winning_team).to be_a Models::Team
          expect(scoring_play.league_abbreviation).to eq 'NHL'
        end

        nhl_scoring_play = nhl_scoring_plays.first

        expect(nhl_scoring_play.id).to eq 'd3809aba-4da3-4d8d-81a0-e98c4ffc1d97'
        expect(nhl_scoring_play.conversion).to be_nil
        expect(nhl_scoring_play.conversion_points).to eq 0
        expect(nhl_scoring_play.empty_net).to eq false
        expect(nhl_scoring_play.name).to eq 'EV Goal'
        expect(nhl_scoring_play.period_number).to eq 2
        expect(nhl_scoring_play.period_seconds).to eq 32
        expect(nhl_scoring_play.points).to eq 1
        expect(nhl_scoring_play.scored_at).to be_a DateTime
        expect(nhl_scoring_play.scoring_conversion).to be_nil
        expect(nhl_scoring_play.scoring_conversion_points).to eq 0
        expect(nhl_scoring_play.scoring_how).to be_nil
        expect(nhl_scoring_play.scoring_method).to eq 'goal'
        expect(nhl_scoring_play.scoring_type).to eq 'ev'
        expect(nhl_scoring_play.time_code).to eq 'PT0M32S'
        expect(nhl_scoring_play.yards).to eq 0
        expect(nhl_scoring_play.game_id).to eq '9f6108e5-41d1-4a37-a8a1-72e3c71b9387'
        expect(nhl_scoring_play.opponent_id).to eq '54410a6b-c9e0-443e-a4cf-b3e22f2cbb75'
        expect(nhl_scoring_play.team_id).to eq 'e9d7bcb5-6723-4ca9-b1d9-1ccd026be1cb'

        expect(nhl_scoring_play.team_name).to eq 'Boston'
        expect(nhl_scoring_play.away_team_name).to eq 'Columbus'
        expect(nhl_scoring_play.home_team_name).to eq 'Boston'
        expect(nhl_scoring_play.winning_team_name).to eq 'Boston'
        expect(nhl_scoring_play.opponent_name).to eq 'Columbus'
        expect(nhl_scoring_play.venue_name).to eq 'TD Garden'
      end

      it 'populates the scoring_play players' do
        nhl_scoring_play = nhl_scoring_plays.first

        nhl_scoring_play.scoring_players.each do |scoring_player|
          expect(scoring_player.player).to be_a Stattleship::Models::Player
        end
      end

      it 'populates the scoring_play player' do
        nhl_scoring_play = nhl_scoring_plays.first
        nhl_scoring_player = nhl_scoring_play.scoring_players.first
        player = nhl_scoring_player.player

        expect(nhl_scoring_player).to be_a Stattleship::Models::ScoringPlayer
        expect(player).to be_a Stattleship::Models::Player
        expect(nhl_scoring_player.role).to eq 'scorer'
        expect(nhl_scoring_player.name).to eq 'Scorer'
        expect(nhl_scoring_player.player_name).to eq 'Brad Marchand'
      end

      it 'gets scorers' do
        nhl_scoring_play = nhl_scoring_plays.first
        expect(nhl_scoring_play.scorers).not_to be_empty
      end

      it 'gets scorer' do
        nhl_scoring_play = nhl_scoring_plays.first
        expect(nhl_scoring_play.scorer).to be_a Stattleship::Models::ScoringPlayer
      end

      it 'gets scorer name' do
        nhl_scoring_play = nhl_scoring_plays.first
        expect(nhl_scoring_play.scorer_name).to eq 'Brad Marchand'
      end

      it 'gets assists' do
        nhl_scoring_play = nhl_scoring_plays.first
        expect(nhl_scoring_play.assists.map(&:role)).to eq ['assist', 'assist']
      end

      it 'gets assist_names' do
        nhl_scoring_play = nhl_scoring_plays.first
        expect(nhl_scoring_play.assist_names).to eq 'Ryan Spooner, Patrice Bergeron'
      end

      it 'makes a sentence' do
        nhl_scoring_play = nhl_scoring_plays.first
        sentence = 'Brad Marchand (Ryan Spooner, Patrice Bergeron) - 00:32 of 2P - vs Columbus 01/23/16'
        expect(nhl_scoring_play.to_sentence).to eq sentence
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch hockey scoring_plays' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/scoring_plays.json'))

        HockeyScoringPlays.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/hockey/nhl/scoring_plays?team_id=nhl-bos")
        ).to have_been_made.once
      end

      it 'parses and builds the hockey scoring_plays' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nhl/scoring_plays.json'))

        scoring_plays = HockeyScoringPlays.fetch(params: params)

        expect(scoring_plays.count).to eq 5

        scoring_plays.each do |scoring_play|
          expect(scoring_play).to be_a Models::ScoringPlay
        end
      end

      def params
        Stattleship::Params::HockeyScoringPlaysParams.new.tap do |params|
          params.team_id = 'nhl-bos'
        end
      end
    end
  end
end
