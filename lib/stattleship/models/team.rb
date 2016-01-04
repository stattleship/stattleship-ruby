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
        league.abbreviation
      end
    end

    module TeamRepresenter
      include Roar::JSON

      property :id
      property :league_id
      property :location
      property :name
      property :nickname
      property :slug
    end
  end
end
