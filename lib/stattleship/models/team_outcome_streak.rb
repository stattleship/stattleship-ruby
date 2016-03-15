module Stattleship
  module Models
    class TeamOutcomeStreak < OpenStruct
      def current?
        current
      end

      def league_name
        league.name
      end

      def league_abbreviation
        league.abbreviation
      end

      def team_location
        team.location
      end

      def team_name
        team.name
      end

      def team_nickname
        team.nickname
      end

      def team_full_name
        team.full_name
      end

      def to_sentence
        if current
          "#{team_full_name} is currently on a #{streak_length} game #{outcome} streak starting on #{started_on}"
        else
          "#{team_full_name} had a #{streak_length} game #{outcome} streak between #{started_on} and #{ended_on}"
        end
      end

      def to_rank
        "#{team_full_name} #{rank.ordinalize} streak of the season is a #{streak_length} game #{outcome} streak between #{started_on} and #{ended_on}."
      end
    end

    module TeamOutcomeStreakRepresenter
      include Roar::JSON
      include Roar::Coercion
      include Virtus.model

      property :league_id
      property :season_id
      property :team_id
      property :current, type: Boolean, default: false
      property :ended_on, type: Date
      property :game_number, type: Integer
      property :outcome
      property :rank, type: Integer
      property :started_on, type: Date
      property :streak, type: Integer
      property :streak_length, type: Integer
      property :streak_length_in_days, type: Integer
    end
  end
end
