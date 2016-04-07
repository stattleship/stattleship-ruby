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

      def losing_team_colors
        if losing_team
          losing_team.colors
        end
      end

      def losing_team
        if home_team_slug == winning_team_slug
          away_team
        else
          home_team
        end
      end

      def losing_team_name
        if losing_team
          losing_team.name
        end
      end

      def losing_team_slug
        if losing_team
          losing_team.slug
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
        started_at.strftime('%m/%d/%y')
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

      def latitude
        if venue
          venue.latitude
        end
      end

      def longitude
        if venue
          venue.longitude
        end
      end

      def coordinates
        [latitude, longitude]
      end

      def losing_score
        if score
          score.split('-').
            map(&:to_i).
            sort.
            join('-')
        end
      end

      def winning_score
        if score
          score.split('-').
            map(&:to_i).
            sort.
            reverse.
            join('-')
        end
      end

      def winning_team_score
        [away_team_score, home_team_score].max
      end

      def losing_team_score
        [away_team_score, home_team_score].min
      end

      def winning_scoreline
        if winning_team && losing_team
          "#{winning_team.nickname} #{winning_team_score} - #{losing_team.nickname} #{losing_team_score}"
        else
          ''
        end
      end

      def losing_scoreline
        if winning_team && losing_team
          "#{losing_team.nickname} #{losing_team_score} - #{winning_team.nickname} #{winning_team_score}"
        else
          ''
        end
      end

      def to_sentence
        "#{winning_team_name} won #{winning_score} on #{short_date}"
      end

      def dump
        to_h.
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
        :status,
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

      collection :official_ids
    end
  end
end
