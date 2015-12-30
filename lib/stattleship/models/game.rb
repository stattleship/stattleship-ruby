module Stattleship
  module Models
    class Game < OpenStruct
      def city
        venue.city
      end

      def league_name
        league.name
      end

      def league_abbreviation
        league.abbreviation
      end
    end

    module GameRepresenter
      include Roar::JSON

      [
        :id,
        :at_neutral_site,
        :attendance,
        :away_team_outcome,
        :away_team_score,
        :daytime,
        :duration,
        :ended_at,
        :home_team_outcome,
        :home_team_score,
        :interval,
        :interval_number,
        :interval_type,
        :label,
        :name,
        :on,
        :score,
        :score_differential,
        :scoreline,
        :slug,
        :started_at,
        :temperature,
        :temperature_unit,
        :timestamp,
        :title,
        :weather_conditions,
        :wind_direction,
        :wind_speed,
        :wind_speed_unit,
      ].each do |attribute|
        property attribute
      end

      [
        :home_team_id,
        :away_team_id,
        :winning_team_id,
        :season_id,
        :venue_id,
      ].each do |relationship|
        property relationship
      end
    end
  end
end
