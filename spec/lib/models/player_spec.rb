require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe Player do
      it 'constructs a player from json' do
        expect(player).to be_a Player
      end

      it 'sets the player identifiers' do
        expect(player.id).to eq('8a343383-9e21-4a52-b2d9-10ec515d6edb')
        expect(player.slug).to eq('nfl-drew-brees')
        expect(player.team_id).to eq('a192531d-e60c-4256-8220-f3538dd8b020')
      end

      it 'sets the player names' do
        expect(player.first_name).to eq('Drew')
        expect(player.last_name).to eq('Brees')
        expect(player.name).to eq('Drew Brees')
      end

      it 'sets the player position' do
        expect(player.position_abbreviation).to eq('QB')
        expect(player.position_name).to eq('Quarterback')
      end

      it 'sets the player dob' do
        expect(player.birth_date).to eq(Date.parse('1995-02-09'))
      end

      def player
        @player ||= begin
          json = File.read('spec/fixtures/nfl/player.json')
          player = Player.new
          player.extend(PlayerRepresenter)
          player.from_json(json)
        end
      end
    end
  end
end
