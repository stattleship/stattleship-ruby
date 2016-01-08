require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe Injury do
      it 'constructs a injury from json' do
        expect(injury).to be_a Injury
      end

      it 'sets the injury identifiers' do
        expect(injury.id).to eq('352c27f9-8f89-45f3-9f9c-1469fd5409a0')
        expect(injury.player_id).to eq('c10a5520-7cda-43cf-be19-30e0bb877c54')
        expect(injury.season_id).to eq('07f6794a-5312-4ce9-b5b0-2010c5975ff2')
        expect(injury.team_id).to eq('e6094723-20f3-417a-87d2-1ccc0b7a6388')
      end

      it 'sets the injury info' do
        expect(injury.started_on).to eq Date.parse('2015-12-20')
        expect(injury.status_updated_at).to eq DateTime.parse('2016-01-04T17:26:07-05:00')
        expect(injury.note).to eq 'Okung is recovering from a strained calf but is expected to return for the NFC Wild Card game against the Vikings.'
        expect(injury.status).to eq 'probable'
        expect(injury.status_label).to eq 'Prob Sun'
      end

      it 'sets the injury location' do
        expect(injury.location_name).to eq('Calf')
      end

      def injury
        json = File.read('spec/fixtures/nfl/injury.json')
        injury = Injury.new
        injury.extend(InjuryRepresenter)
        injury.from_json(json)
      end
    end
  end
end
