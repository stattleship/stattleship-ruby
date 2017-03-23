module Stattleship
  module Models
    class LineUp < OpenStruct
      def to_sentence
        "#{player_label} : #{inning_half} #{inning} inning #{batting_order} batting order #{lineup_position} lineup position"
      end

      def player_name
        player.full_name
      end

      def player_label
        player.label
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
        position_abbreviation == 'RP'
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


      def dump
        {
          id: id,
          player_name: player_name,
          inning_half: inning_half,
          position_name: position_name,
          position_abbreviation: position_abbreviation,
          inning: inning,
          batting_order: batting_order,
          lineup_position: lineup_position,
          sequence: sequence,
        }
      end
    end

    module LineUpRepresenter
      include Roar::JSON
      include Roar::Coercion
      include Virtus.model

      [
        :id,
        :inning_half,
        :position_name,
        :position_abbreviation,
      ].each do |attribute|
        property attribute
      end

      [
        :inning,
        :batting_order,
        :lineup_position,
        :sequence,
      ].each do |attribute|
        property attribute, type: Integer
      end

      [
        :game_id,
        :player_id,
        :team_id,
      ].each do |relationship|
        property relationship
      end
    end
  end
end
