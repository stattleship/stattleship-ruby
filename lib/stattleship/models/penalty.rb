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

      def subject_name
        if team_penalty
          team_name
        else
          "#{player_name} (#{team_name})"
        end
      end

      def period_time
        Time.at(period_seconds).utc.strftime('%M:%S')
      end

      def period_abbreviation
        if game.hockey?
          "P"
        else
          "Q"
        end
      end

      def period
        "#{period_number}#{period_abbreviation}"
      end

      def at
        "#{period_time} of #{period}"
      end

      def vs
        if game
          "vs #{opponent_name} #{game.short_date}"
        end
      end

      def to_sentence
        "#{subject_name} - #{label} - #{minutes} minutes - #{at} - #{vs}"
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
      property :period_abbreviation
      property :period_time
      property :player_id
      property :seconds, type: Integer
      property :team_penalty, type: Boolean, default: false
      property :team_id
      property :time_code
    end
  end
end
