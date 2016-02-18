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

      it 'sets the primary hashtag' do
        expect(team.hashtag).to eq('Raptors')
        expect(team.hashtag_with_hash).to eq('#Raptors')
      end

      it 'sets the list of hashtags' do
        expect(team.hashtags).to eq(['Raptors', 'NBARaptors'])
        expect(team.hashtags_with_hash).to eq(['#Raptors', '#NBARaptors'])
      end

      it 'dumps all info to a hash' do
        expect(dump).to have_key(:full_name)
        expect(dump).to have_key(:title)
      end

      it 'sets the team geocodes' do
        expect(team.latitude).to eq(38.8980412)
        expect(team.longitude).to eq(-77.0209114)
        expect(team.coordinates).to eq([38.8980412, -77.0209114])
      end

      def team
        @team ||= begin
          json = File.read('spec/fixtures/nba/team.json')
          team = Team.new
          team.extend(TeamRepresenter)
          team.from_json(json)
        end
      end

      def dump
        @dump ||= team.dump
      end
    end
  end
end
