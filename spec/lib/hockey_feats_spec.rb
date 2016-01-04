require 'spec_helper'

module Stattleship
  RSpec.describe HockeyFeats do
    describe '#feats' do
      it 'returns all the nhl_player_feats' do
        expect(nhl_player_feats.count).to eq 5
      end
    end

    describe '.fetch' do
      context 'for player feats' do
        it 'makes a request to fetch hockey player feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nhl/player_feats.json'))

          HockeyFeats.fetch(params: player_feats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/hockey/nhl/feats?feat=receptions_looks&level_up=3")
          ).to have_been_made.once
        end

        it 'parses and builds the hockey player feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nhl/player_feats.json'))

          feats = HockeyFeats.fetch(params: player_feats_params)

          expect(feats.count).to eq 5

          feats.each do |feat|
            expect(feat).to be_a Stattleship::Feat
            expect(feat.player).to be_a Stattleship::Models::Player
            expect(feat.subject).to be_a Stattleship::Models::Player
            expect(feat.player.team).to be_a Stattleship::Models::Team
            expect(feat.level).to eq 'rare'
          end

          expect(feats.first.actual).to eq "4.0"
          expect(feats.first.actual_value).to eq 4
          expect(feats.first.player.name).to eq 'Erik Karlsson'
          expect(feats.first.subject.name).to eq 'Erik Karlsson'
          expect(feats.first.subject_name).to eq 'Erik Karlsson'
        end
      end

      context 'for team feats' do
        it 'makes a request to fetch hockey team feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nhl/team_feats.json'))

          HockeyFeats.fetch(params: team_feats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/hockey/nhl/feats?level=rare&since=1%20month%20ago&team_id=nhl-col")
          ).to have_been_made.once
        end

        it 'parses and builds the hockey team feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nhl/team_feats.json'))

          feats = HockeyFeats.fetch(params: team_feats_params)

          expect(feats.count).to eq 20

          feats.each do |feat|
            expect(feat).to be_a Stattleship::Feat
            expect(feat.team).to be_a Stattleship::Models::Team
            expect(feat.subject).to be_a Stattleship::Models::Team
          end

          expect(feats.first.actual).to eq "1.0"
          expect(feats.first.actual_value).to eq 1
          expect(feats.first.team.name).to eq 'Colorado'
          expect(feats.first.subject.name).to eq 'Colorado'
          expect(feats.first.subject_name).to eq 'Colorado'
        end
      end

      def player_feats_params
        Stattleship::Params::HockeyFeatsParams.new.tap do |params|
          params.feat = 'receptions_looks'
          params.level_up = 3
        end
      end

      def team_feats_params
        Stattleship::Params::HockeyFeatsParams.new.tap do |params|
          params.level = 'rare'
          params.team_id = 'nhl-col'
          params.since = '1 month ago'
        end
      end
    end
  end
end
