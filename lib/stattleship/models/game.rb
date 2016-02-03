module Stattleship
  module Models
    class Game < OpenStruct
      def city
        if venue
          venue.city
        end
      end

      def colors
        [away_team_colors, home_team_colors].
          flatten.
          compact.
          uniq
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

      def away_team_colors
        if away_team
          away_team.colors
        end
      end

      def away_team_name
        if away_team
          away_team.name
        end
      end

      def away_team_slug
        if away_team
          away_team.slug
        end
      end

      def home_team_colors
        if home_team
          home_team.colors
        end
      end

      def home_team_name
        if home_team
          home_team.name
        end
      end

      def home_team_slug
        if home_team
          home_team.slug
        end
      end

      def state
        if venue
          venue.state
        end
      end

      def team_slugs
        [away_team_slug,
         home_team_slug].compact
      end

      def winning_team_colors
        if winning_team
          winning_team.colors
        end
      end

      def winning_team_name
        if winning_team
          winning_team.name
        end
      end

      def winning_team_slug
        if winning_team
          winning_team.slug
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

      def venue_name
        if venue
          venue.name
        end
      end

      def venue_slug
        if venue
          venue.slug
        end
      end

      def dump
        to_hash.
          merge(
            away_team_colors: away_team_colors,
            away_team_name: away_team_name,
            away_team_slug: away_team_slug,
            city: city,
            colors: colors,
            home_team_colors: home_team_colors,
            home_team_name: home_team_name,
            home_team_slug: home_team_slug,
            league_abbreviation: league_abbreviation,
            league_name: league_name,
            short_date: short_date,
            sport: sport,
            state: state,
            team_slugs: team_slugs,
            venue_name: venue_name,
            venue_slug: venue_slug,
            venue_capacity: venue_capacity,
            winning_team_colors: winning_team_colors,
            winning_team_name: winning_team_name,
            winning_team_slug: winning_team_slug,
          )
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
