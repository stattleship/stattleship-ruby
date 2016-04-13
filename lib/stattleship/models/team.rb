module Stattleship
  module Models
    class Team < OpenStruct
      def full_name
        "#{location} #{nickname}"
      end

      def title
        "#{full_name} - #{league_abbreviation}"
      end

      def league_abbreviation
        if league
          league.abbreviation
        end
      end

      def color_css
        "##{color}"
      end

      def colors_css
        if colors
          colors.map { |c| "##{c}"}
        end
      end

      def hashtag_with_hash
        "##{hashtag}"
      end

      def hashtags_with_hash
        if hashtags
          hashtags.map { |c| "##{c}"}
        end
      end

      def dump
        {
          full_name: full_name,
          title: title,
          color: color,
          colors: colors,
          hashtag: hashtag,
          hashtags: hashtags,
          league_abbreviation: league_abbreviation,
          location: location,
          latitude: latitude,
          longitude: longitude,
          name: name,
          nickname: nickname,
          slug: slug,
        }
      end

      def coordinates
        [latitude, longitude]
      end
    end

    module TeamRepresenter
      include Roar::JSON

      property :id
      property :color
      collection :colors
      property :hashtag
      collection :hashtags
      property :league_id
      property :location
      property :latitude, type: Float
      property :longitude, type: Float
      property :name
      property :nickname
      property :slug
    end
  end
end
