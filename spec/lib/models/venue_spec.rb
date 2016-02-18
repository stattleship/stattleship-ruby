require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe Venue do
      it 'constructs a venue from json' do
        expect(venue).to be_a Venue
      end

      it 'sets the venue identifiers' do
        expect(venue.id).to eq('94b2c2fb-95c5-4827-b575-caf317660445')
        expect(venue.slug).to eq('amal')
      end

      it 'sets the venue names' do
        expect(venue.abbreviation).to eq('AMAL')
        expect(venue.name).to eq('Amalie Arena')
      end

      it 'sets the venue locations' do
        expect(venue.capacity).to eq 19204
        expect(venue.city).to eq('Tampa')
        expect(venue.state).to eq('Florida')
        expect(venue.country).to eq('USA')
        expect(venue.time_zone).to eq('US/Eastern')
        expect(venue.field_type).to be_nil
      end

      it 'sets the venue geocodes' do
        expect(venue.latitude).to eq(38.8980412)
        expect(venue.longitude).to eq(-77.0209114)
        expect(venue.coordinates).to eq([38.8980412, -77.0209114])
      end

      def venue
        json = File.read('spec/fixtures/nhl/venue.json')
        venue = Venue.new
        venue.extend(VenueRepresenter)
        venue.from_json(json)
      end
    end
  end
end
