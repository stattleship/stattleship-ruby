module Stattleship
  module Models
    class Player < OpenStruct
      def label
        "#{name} (#{position_abbreviation}) - #{team_nickname}"
      end

      def team_name
        team.name
      end

      def team_nickname
        team.nickname
      end
    end

    module PlayerRepresenter
      include Roar::JSON

      property :first_name
      property :id
      property :last_name
      property :name
      property :position_abbreviation
      property :position_name
      property :slug
      property :team_id
    end
  end
end
