module Stattleship
  module Models
    class Game < OpenStruct
      def city
        if venue
          venue.city
        end
      end

      def sport
        if league
          league.sport
        end
      end

      def league_name
        if league
          league.name
        end
      end

      def league_abbreviation
        if league
          league.abbreviation
        end
      end

      def away_team_hash
        if away_team
          away_team.dump
        end
      end

      def away_team_name
        if away_team
          away_team.name
        end
      end

      def home_team_hash
        if home_team
          home_team.dump
        end
      end

      def home_team_name
        if home_team
          home_team.name
        end
      end

      def winning_team_hash
        if winning_team
          winning_team.dump
        end
      end

      def winning_team_name
        if winning_team
          winning_team.name
        end
      end

      def hockey?
        league.hockey?
      end

      def basketball?
        league.basketball?
      end

      def football?
        league.football?
      end

      def short_date
        started_at.strftime('%m/%e/%y')
      end

      def venue_capacity
        if venue
          venue.capacity
        end
      end

      def venue_hash
        if venue
          venue.dump
        end
      end

      def venue_name
        if venue
          venue.name
        end
      end

      def dump
        if self.to_hash
          self.to_hash.
            merge(
              away_team: away_team_hash,
              away_team_name: away_team_name,
              city: city,
              home_team: home_team_hash,
              home_team_name: home_team_name,
              league_abbreviation: league_abbreviation,
              league_name: league_name,
              short_date: short_date,
              sport: sport,
              venue: venue_hash,
              venue_name: venue_name,
              venue_capacity: venue_capacity,
              winning_team: winning_team_hash,
              winning_team_name: winning_team_name,
            )
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
