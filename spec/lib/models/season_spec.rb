require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe Season do
      it 'constructs a team from json' do
        expect(season).to be_a Season
      end

      it 'sets the season identifiers' do
        expect(season.id).to eq('07f6794a-5312-4ce9-b5b0-2010c5975ff2')
        expect(season.slug).to eq('nfl-2015-2016')
        expect(season.league_id).to eq('ebb52980-4b25-4384-bb32-26d354568f0c')
      end

      it 'sets the season names' do
        expect(season.name).to eq('2015-2016')
      end

      it 'sets the season dates' do
        expect(season.starts_on).to eq('2015-08-01')
        expect(season.ends_on).to eq('2016-02-14')
      end

      def season
        json = File.read('spec/fixtures/nfl/season.json')
        season = Season.new
        season.extend(SeasonRepresenter)
        season.from_json(json)
      end
    end
  end
end
