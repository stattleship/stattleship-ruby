module Stattleship
  module Models
    class League < OpenStruct
      def hockey?
        sport == 'hockey'
      end

      def basetball?
        sport == 'baseball'
      end

      def basketball?
        sport == 'basketball'
      end

      def football?
        sport == 'football'
      end
    end

    module LeagueRepresenter
      include Roar::JSON
      include Roar::Coercion

      property :abbreviation
      property :color
      property :id
      property :minutes_per_period, type: Integer
      property :name
      property :periods, type: Integer
      property :slug
      property :sport
    end
  end
end
