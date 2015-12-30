require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe League do
      it 'constructs a league from json' do
        expect(league).to be_a League
      end

      it 'sets the league identifiers' do
        expect(league.id).to eq('48803e9e-c4ec-414a-a85d-9abfa6e9cfd9')
        expect(league.slug).to eq('nhl')
      end

      it 'sets the league names' do
        expect(league.name).to eq('National Hockey League')
        expect(league.abbreviation).to eq('NHL')
      end

      it 'sets the league sport' do
        expect(league.sport).to eq('hockey')
      end

      def league
        json = File.read('spec/fixtures/nhl/league.json')
        league = League.new
        league.extend(LeagueRepresenter)
        league.from_json(json)
      end
    end
  end
end
