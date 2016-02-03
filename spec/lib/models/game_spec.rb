require 'spec_helper'

module Stattleship
  module Models
    RSpec.describe Game do
      it 'constructs a game from json' do
        expect(game).to be_a Game
      end

      it 'sets the game identifiers' do
        expect(game.id).to eq('e503cd9e-0fcc-4559-96a8-d47772e13a85')
        expect(game.slug).to eq('nba-2015-2016-lac-sac-2015-10-28-1900')
      end

      it 'sets the game names' do
        expect(game.label).to eq('Clippers vs Kings')
        expect(game.name).to eq('Clippers vs Kings October 28, 2015 at  7:00pm')
        expect(game.title).to eq('Clippers vs Kings')
      end

      it 'sets the game dates' do
        expect(game.ended_at).to eq(DateTime.parse('2015-10-28T21:36:47-07:00'))
        expect(game.started_at).to eq(DateTime.parse('2015-10-28T19:00:00-07:00'))
        expect(game.timestamp).to eq(1446084000)
        expect(game.on).to eq('on October 28, 2015')
      end

      it 'sets the game scores' do
        expect(game.home_team_score).to eq(104)
        expect(game.home_team_outcome).to eq('loss')
        expect(game.away_team_score).to eq(111)
        expect(game.away_team_outcome).to eq('win')
        expect(game.score).to eq('111-104')
        expect(game.score_differential).to eq(7)
        expect(game.scoreline).to eq('Clippers 111 - Kings 104')
      end

      it 'sets the game metrics' do
        expect(game.attendance).to eq(17458)
        expect(game.duration).to eq(8340)
      end

      it 'dumps all info to a hash' do
        expect(dump).to have_key(:colors)
        expect(dump).to have_key(:home_team_colors)
        expect(dump).to have_key(:away_team_name)
        expect(dump).to have_key(:away_team_slug)
        expect(dump).to have_key(:home_team_colors)
        expect(dump).to have_key(:home_team_name)
        expect(dump).to have_key(:home_team_slug)
        expect(dump).to have_key(:league_abbreviation)
        expect(dump).to have_key(:league_name)
        expect(dump).to have_key(:city)
        expect(dump).to have_key(:short_date)
        expect(dump).to have_key(:state)
        expect(dump).to have_key(:team_slugs)
        expect(dump).to have_key(:venue_name)
        expect(dump).to have_key(:venue_capacity)
        expect(dump).to have_key(:venue_slug)
        expect(dump).to have_key(:winning_team_colors)
        expect(dump).to have_key(:winning_team_name)
        expect(dump).to have_key(:winning_team_slug)
      end

      def game
        @game ||= begin
                    json = File.read('spec/fixtures/nba/game.json')
                    game = Game.new
                    game.extend(GameRepresenter)
                    game.from_json(json)
                  end
      end

      def dump
        @dump ||= game.dump
      end
    end
  end
end
