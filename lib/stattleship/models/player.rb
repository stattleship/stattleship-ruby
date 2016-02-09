module Stattleship
  module Models
    class Player < OpenStruct
      def label
        "#{name} (#{position_abbreviation}) - #{team_nickname}"
      end

      def team_name
        if team
          team.name
        end
      end

      def team_nickname
        if team
          team.nickname
        end
      end

      def team_hash
        if team
          team.dump
        end
      end

      def dump
        to_h.
          merge(
            label: label,
            team: team_hash,
            team_name: team_name,
            team_nickname: team_nickname,
          )
        end
    end

    module PlayerRepresenter
      include Roar::JSON
      include Roar::Coercion

      property :birth_date, type: Date
      property :first_name
      property :handedness
      property :height, type: Integer
      property :humanized_salary
      property :id
      property :last_name
      property :name
      property :position_abbreviation
      property :position_name
      property :salary, type: Bignum
      property :salary_currency
      property :school
      property :slug
      property :sport
      property :team_id
      property :unit_of_height
      property :unit_of_weight
      property :weight, type: Integer
      property :years_of_experience, type: Integer
    end
  end
end
