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

      def away_team_name
        if away_team
          away_team.name
        end
      end

      def home_team_name
        if home_team
          home_team.name
        end
      end

      def winning_team_name
        if winning_team
          winning_team.name
        end
      end
    end

    module GameRepresenter
      include Roar::JSON
      include Roar::Coercion

      [
        :id,
        :at_neutral_site,
        :away_team_outcome,
        :daytime,
        :home_team_outcome,
        :interval,
        :interval_type,
        :label,
        :name,
        :on,
        :score,
        :scoreline,
        :slug,
        :temperature_unit,
        :title,
        :weather_conditions,
        :wind_direction,
        :wind_speed,
        :wind_speed_unit,
      ].each do |attribute|
        property attribute
      end

      [
        :attendance,
        :away_team_score,
        :home_team_score,
        :duration,
        :interval_number,
        :score_differential,
        :temperature,
        :timestamp,
      ].each do |attribute|
        property attribute, type: Integer
      end

      [
        :ended_at,
        :started_at,
      ].each do |attribute|
        property attribute, type: DateTime
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
