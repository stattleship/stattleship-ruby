require 'spec_helper'

module Stattleship
  RSpec.describe BaseballFeats do
    describe '#feats' do
      it 'returns all the mlb_player_feats' do
        expect(mlb_player_feats.count).to eq 3
      end
    end

    describe '.fetch' do
      context 'for player feats' do
        it 'makes a request to fetch Baseball player feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/mlb/player_feats.json'))

          BaseballFeats.fetch(params: player_feats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/baseball/mlb/feats?feat=pitches_thrown&level_up=3")
          ).to have_been_made.once
        end

        it 'parses and builds the Baseball player feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/mlb/player_feats.json'))

          feats = BaseballFeats.fetch(params: player_feats_params)

          expect(feats.count).to eq 3

          feats.each do |feat|
            expect(feat).to be_a Stattleship::Feat
            expect(feat.player).to be_a Stattleship::Models::Player
            expect(feat.subject).to be_a Stattleship::Models::Player
            expect(feat.player.team).to be_a Stattleship::Models::Team
            expect(feat.level).to eq 'rare'
          end

          expect(feats.first.actual).to eq 116
          expect(feats.first.player.name).to eq 'Kyle Lohse'
          expect(feats.first.subject.name).to eq 'Kyle Lohse'
          expect(feats.first.subject_name).to eq 'Kyle Lohse'
        end
      end

      context 'for team feats' do
        it 'makes a request to fetch Baseball team feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/mlb/team_feats.json'))

          BaseballFeats.fetch(params: team_feats_params)

          expect(
            a_request(:get,
                      "#{base_api_url}/baseball/mlb/feats?level=often&team_id=mlb-kc")
          ).to have_been_made.once
        end

        it 'parses and builds the Baseball team feats' do
          stub_request(:get, /#{base_api_url}.*/).
            to_return(body: File.read('spec/fixtures/mlb/team_feats.json'))

          feats = BaseballFeats.fetch(params: team_feats_params)

          expect(feats.count).to eq 1

          feats.each do |feat|
            expect(feat).to be_a Stattleship::Feat
            expect(feat.team).to be_a Stattleship::Models::Team
            expect(feat.subject).to be_a Stattleship::Models::Team
          end

          expect(feats.first.actual).to eq 2.0
          expect(feats.first.team.name).to eq 'Kansas City'
          expect(feats.first.subject.name).to eq 'Kansas City'
          expect(feats.first.subject_name).to eq 'Kansas City'
        end
      end

      def player_feats_params
        Stattleship::Params::BaseballFeatsParams.new.tap do |params|
          params.feat = 'pitches_thrown'
          params.level_up = 3
        end
      end

      def team_feats_params
        Stattleship::Params::BaseballFeatsParams.new.tap do |params|
          params.level = 'often'
          params.team_id = 'mlb-kc'
        end
      end
    end
  end
end
