require 'spec_helper'

module Stattleship
  RSpec.describe BasketballFeats do
    describe '#feats' do
      it 'returns all the nba_player_feats' do
        expect(nba_player_feats.count).to eq 1
      end
    end

    describe '.fetch' do
      context 'for player feats' do
        it 'makes a request to fetch basketball player feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nba/player_feats.json'))

          BasketballFeats.fetch(params: player_feats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/basketball/nba/feats?feat=three_pointers_made&level_up=3")
          ).to have_been_made.once
        end

        it 'parses and builds the basketball player feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nba/player_feats.json'))

          feats = BasketballFeats.fetch(params: player_feats_params)

          expect(feats.count).to eq 1

          feats.each do |feat|
            expect(feat).to be_a Stattleship::Feat
            expect(feat.player).to be_a Stattleship::Models::Player
            expect(feat.subject).to be_a Stattleship::Models::Player
            expect(feat.player.team).to be_a Stattleship::Models::Team
            expect(feat.level).to eq 'rare'
          end

          expect(feats.first.actual).to eq "7.0"
          expect(feats.first.actual_value).to eq 7
          expect(feats.first.player.name).to eq 'Arron Afflalo'
          expect(feats.first.subject.name).to eq 'Arron Afflalo'
          expect(feats.first.subject_name).to eq 'Arron Afflalo'
        end
      end

      context 'for team feats' do
        it 'makes a request to fetch basketball team feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nba/team_feats.json'))

          BasketballFeats.fetch(params: team_feats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/basketball/nba/feats?level=often&team_id=nba-gs")
          ).to have_been_made.once
        end

        it 'parses and builds the basketball team feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/nba/team_feats.json'))

          feats = BasketballFeats.fetch(params: team_feats_params)

          expect(feats.count).to eq 20

          feats.each do |feat|
            expect(feat).to be_a Stattleship::Feat
            expect(feat.team).to be_a Stattleship::Models::Team
            expect(feat.subject).to be_a Stattleship::Models::Team
          end

          expect(feats.first.actual).to eq "0.427"
          expect(feats.first.actual_value).to eq 0.427
          expect(feats.first.team.name).to eq 'Golden State'
          expect(feats.first.subject.name).to eq 'Golden State'
          expect(feats.first.subject_name).to eq 'Golden State'
        end
      end

      def player_feats_params
        Stattleship::Params::BasketballFeatsParams.new.tap do |params|
          params.feat = 'three_pointers_made'
          params.level_up = 3
        end
      end

      def team_feats_params
        Stattleship::Params::BasketballFeatsParams.new.tap do |params|
          params.level = 'often'
          params.team_id = 'nba-gs'
        end
      end
    end
  end
end
