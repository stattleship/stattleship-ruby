require 'spec_helper'

module Stattleship
  RSpec.describe FootballScoringPlays do
    describe '#scoring_plays' do
      it 'returns all the nfl_scoring_plays' do
        expect(nfl_scoring_plays.count).to eq 3
      end

      it 'populates the scoring_play' do
        nfl_scoring_plays.each do |scoring_play|
          expect(scoring_play).to be_a Models::ScoringPlay
          expect(scoring_play.game).to be_a Models::Game
          expect(scoring_play.league).to be_a Models::League
          expect(scoring_play.team).to be_a Models::Team

          expect(scoring_play.away_team).to be_a Models::Team
          expect(scoring_play.home_team).to be_a Models::Team
          expect(scoring_play.winning_team).to be_a Models::Team
          expect(scoring_play.league_abbreviation).to eq 'NFL'
        end

        nfl_scoring_play = nfl_scoring_plays.first

        expect(nfl_scoring_play.id).to eq '3f0b0523-92d6-4615-b028-e00747949e7c'
        expect(nfl_scoring_play.conversion).to eq 'xpt-success'
        expect(nfl_scoring_play.conversion_points).to eq 1
        expect(nfl_scoring_play.empty_net).to eq false
        expect(nfl_scoring_play.name).to eq 'Touchdown'
        expect(nfl_scoring_play.period_number).to eq 1
        expect(nfl_scoring_play.period_seconds).to eq 430
        expect(nfl_scoring_play.points).to eq 6
        expect(nfl_scoring_play.scored_at).to be_nil
        expect(nfl_scoring_play.scoring_conversion).to be_nil
        expect(nfl_scoring_play.scoring_conversion_points).to eq 0
        expect(nfl_scoring_play.scoring_how).to eq 'pass'
        expect(nfl_scoring_play.scoring_method).to eq 'scoring-play'
        expect(nfl_scoring_play.scoring_type).to eq 'touchdown'
        expect(nfl_scoring_play.time_code).to eq 'PT7M10S'
        expect(nfl_scoring_play.yards).to eq 5
        expect(nfl_scoring_play.game_id).to eq 'cc7f7ba5-a4b5-4e87-963a-0691b2840394'
        expect(nfl_scoring_play.opponent_id).to eq 'a8004516-b1d9-44df-b6ba-d5e4b7d9d1d7'
        expect(nfl_scoring_play.team_id).to eq '5546974d-27c2-4d93-a63e-d8320952e871'

        expect(nfl_scoring_play.team_name).to eq 'New England'
        expect(nfl_scoring_play.away_team_name).to eq 'Tennessee'
        expect(nfl_scoring_play.home_team_name).to eq 'New England'
        expect(nfl_scoring_play.winning_team_name).to eq 'New England'
        expect(nfl_scoring_play.opponent_name).to eq 'Tennessee'
        expect(nfl_scoring_play.venue_name).to eq 'Gillette Stadium'
      end

      it 'populates the scoring_play players' do
        nfl_scoring_play = nfl_scoring_plays.first

        nfl_scoring_play.scoring_players.each do |scoring_player|
          expect(scoring_player.player).to be_a Stattleship::Models::Player
        end
      end

      it 'populates the scoring_play player' do
        nfl_scoring_play = nfl_scoring_plays.first
        nfl_scoring_player = nfl_scoring_play.scoring_players.first
        player = nfl_scoring_player.player

        expect(nfl_scoring_player).to be_a Stattleship::Models::ScoringPlayer
        expect(player).to be_a Stattleship::Models::Player
        expect(nfl_scoring_player.role).to eq 'conv-kicker'
        expect(nfl_scoring_player.name).to eq 'Conv Kicker'
        expect(nfl_scoring_player.player_name).to eq 'Stephen Gostkowski'
      end

      it 'makes a sentence' do
        nfl_scoring_play = nfl_scoring_plays.first
        sentence = '1 QTR 07:10 - 6 points - 5 yards - Stephen Gostkowski, Conv Kicker, Tom Brady, Passer, Rob Gronkowski, Pass Receiver - vs Tennessee 12/20/15'
        expect(nfl_scoring_play.to_sentence).to eq sentence
      end
    end

    describe '.fetch' do
      it 'makes a request to fetch football scoring_plays' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/scoring_plays.json'))

        FootballScoringPlays.fetch(params: params)

        expect(
          a_request(:get,
                    "#{base_api_url}/football/nfl/scoring_plays?team_id=nfl-ne")
        ).to have_been_made.once
      end

      it 'parses and builds the football scoring_plays' do
        stub_request(:get, /#{base_api_url}.*/).
          to_return(body: File.read('spec/fixtures/nfl/scoring_plays.json'))

        scoring_plays = FootballScoringPlays.fetch(params: params)

        expect(scoring_plays.count).to eq 3

        scoring_plays.each do |scoring_play|
          expect(scoring_play).to be_a Models::ScoringPlay
        end
      end

      def params
        Stattleship::Params::FootballScoringPlaysParams.new.tap do |params|
          params.team_id = 'nfl-ne'
        end
      end
    end
  end
end
