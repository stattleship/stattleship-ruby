module Stattleship
  module Models
    class AtBat < OpenStruct
      def to_sentence
        description
      end

      def dump
        {
          id: id,
          description: description,
          inning: inning,
          inning_label: inning_label,
          half: half,
          baseball_pitch_ids: baseball_pitch_ids,
        }
      end
    end

    module AtBatRepresenter
      include Roar::JSON
      include Roar::Coercion
      include Virtus.model

      [
        :id,
        :description,
        :inning,
        :inning_label,
        :half,
      ].each do |attribute|
        property attribute
      end

      [
        :game_id,
        :hitter_id,
        :hitter_team_id,
      ].each do |relationship|
        property relationship
      end

      collection :baseball_pitch_ids
    end
  end
end
