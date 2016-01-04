require 'spec_helper'

module Stattleship
  RSpec.describe FootballFeats do
    describe '#feats' do
      it 'returns all the nfl_player_feats' do
        expect(nfl_player_feats.count).to eq 5
      end
    end

    describe '.fetch' do
      context 'for player feats' do
        it 'makes a request to fetch football player feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nfl/player_feats.json'))

          FootballFeats.fetch(params: player_feats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/football/nfl/feats?feat=receptions_looks&level_up=3")
          ).to have_been_made.once
        end

        it 'parses and builds the football player feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nfl/player_feats.json'))

          feats = FootballFeats.fetch(params: player_feats_params)

          expect(feats.count).to eq 5

          feats.each do |feat|
            expect(feat).to be_a Stattleship::Feat
            expect(feat.player).to be_a Stattleship::Models::Player
            expect(feat.subject).to be_a Stattleship::Models::Player
            expect(feat.player.team).to be_a Stattleship::Models::Team
            expect(feat.level).to eq 'rare'
          end

          expect(feats.first.actual).to eq "9.0"
          expect(feats.first.actual_value).to eq 9
          expect(feats.first.player.name).to eq 'Emmanuel Sanders'
          expect(feats.first.subject.name).to eq 'Emmanuel Sanders'
          expect(feats.first.subject_name).to eq 'Emmanuel Sanders'
        end
      end

      context 'for team feats' do
        it 'makes a request to fetch football team feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nfl/team_feats.json'))

          FootballFeats.fetch(params: team_feats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/football/nfl/feats?level=typical&since=1%20month%20ago&team_id=nfl-den")
          ).to have_been_made.once
        end

        it 'parses and builds the football team feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nfl/team_feats.json'))

          feats = FootballFeats.fetch(params: team_feats_params)

          expect(feats.count).to eq 20

          feats.each do |feat|
            expect(feat).to be_a Stattleship::Feat
            expect(feat.team).to be_a Stattleship::Models::Team
            expect(feat.subject).to be_a Stattleship::Models::Team
            expect(feat.team.name).to eq 'Denver'
            expect(feat.subject.name).to eq 'Denver'
            expect(feat.level).to eq 'typical'
          end

          expect(feats.first.actual).to eq "3.0"
          expect(feats.first.actual_value).to eq 3
          expect(feats.first.team.name).to eq 'Denver'
          expect(feats.first.subject.name).to eq 'Denver'
          expect(feats.first.subject_name).to eq 'Denver'
        end
      end

      def player_feats_params
        Stattleship::Params::FootballFeatsParams.new.tap do |params|
          params.feat = 'receptions_looks'
          params.level_up = 3
        end
      end

      def team_feats_params
        Stattleship::Params::FootballFeatsParams.new.tap do |params|
          params.level = 'typical'
          params.team_id = 'nfl-den'
          params.since = '1 month ago'
        end
      end
    end
  end
end
