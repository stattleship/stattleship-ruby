module Stattleship
  module Models
    class Penalty < OpenStruct
      def away_team
        game.away_team
      end

      def home_team
        game.home_team
      end

      def winning_team
        game.winning_team
      end

      def away_team_name
        away_team.name
      end

      def home_team_name
        home_team.name
      end

      def winning_team_name
        winning_team.name
      end

      def city
        venue.city
      end

      def league_name
        league.name
      end

      def league_abbreviation
        league.abbreviation
      end

      def player_name
        player.name
      end

      def opponent_name
        opponent.name
      end

      def opponent_full_name
        opponent.full_name
      end

      def scoreline
        game.scoreline
      end

      def team_name
        team.name
      end

      def team_full_name
        team.full_name
      end

      def venue
        game.venue
      end

      def venue_name
        venue.name
      end
    end

    module PenaltyRepresenter
      include Roar::JSON
      include Roar::Coercion
      include Virtus.model

      property :id
      property :game_id
      property :opponent_id
      property :label
      property :minutes, type: Integer
      property :name
      property :period_number, type: Integer
      property :period_seconds, type: Integer
      property :player_id
      property :seconds, type: Integer
      property :team_penalty, type: Boolean, default: false
      property :team_id
      property :time_code
    end
  end
end
