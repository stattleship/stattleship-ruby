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

      def dump
        if self.to_hash
          self.to_hash.
            merge(
              full_name: full_name,
              title: title,
            )
        end
      end
    end

    module TeamRepresenter
      include Roar::JSON

      property :id
      property :color
      collection :colors
      property :league_id
      property :location
      property :name
      property :nickname
      property :slug
    end
  end
end
