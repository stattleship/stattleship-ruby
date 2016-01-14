require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe Team do
      it 'constructs a team from json' do
        expect(team).to be_a Team
      end

      it 'sets the team identifiers' do
        expect(team.id).to eq('4d457218-ccdf-45cf-8f07-2d7ee7b5032c')
        expect(team.slug).to eq('nba-tor')
      end

      it 'sets the team names' do
        expect(team.name).to eq('Toronto')
        expect(team.nickname).to eq('Raptors')
        expect(team.full_name).to eq('Toronto Raptors')
      end

      it 'sets the team location' do
        expect(team.location).to eq('Toronto')
      end

      it 'sets the primary color' do
        expect(team.color).to eq('ce1141')
        expect(team.color_css).to eq('#ce1141')
      end

      it 'sets the list of colors' do
        expect(team.colors).to eq(['ce1141', '061922', 'a1a1a4', 'b4975a'])
        expect(team.colors_css).to eq(['#ce1141', '#061922', '#a1a1a4', '#b4975a'])
      end

      def team
        json = File.read('spec/fixtures/nba/team.json')
        team = Team.new
        team.extend(TeamRepresenter)
        team.from_json(json)
      end
    end
  end
end
