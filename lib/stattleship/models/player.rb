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
      property :handedness
      property :height
      property :humanized_salary
      property :id
      property :last_name
      property :name
      property :position_abbreviation
      property :position_name
      property :salary
      property :salary_currency
      property :school
      property :slug
      property :sport
      property :team_id
      property :unit_of_height
      property :unit_of_weight
      property :weight
      property :years_of_experience
    end
  end
end
