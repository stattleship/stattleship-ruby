module Stattleship
  module Models
    class Player < OpenStruct
      def active?
        active
      end

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

      def pitcher?
        position_abbreviation == 'SP' ||
        position_abbreviation == 'SP'
      end

      def inflielder?
        position_abbreviation == '1B' ||
        position_abbreviation == '2B' ||
        position_abbreviation == '3B' ||
        position_abbreviation == 'SS' ||
        position_abbreviation == 'C'
      end

      def outflielder?
        position_abbreviation == 'LF' ||
        position_abbreviation == 'CF' ||
        position_abbreviation == 'RF' ||
        position_abbreviation == 'OF'
      end
    end

    module PlayerRepresenter
      include Roar::JSON
      include Roar::Coercion
      include Virtus.model

      property :active, type: Boolean
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
      property :city
      property :state
      property :country
      property :draft_season
      property :draft_round, type: Integer
      property :draft_overall_pick, type: Integer
      property :draft_team_name

    end
  end
end
