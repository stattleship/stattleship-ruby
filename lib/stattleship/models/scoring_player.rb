module Stattleship
  module Models
    class ScoringPlayer < OpenStruct
      def player_name
        player.name
      end
    end

    module ScoringPlayerRepresenter
      include Roar::JSON
      include Roar::Coercion
      include Virtus.model

      property :id
      property :player_id
      property :scoring_play_id

      property :name
      property :role
    end
  end
end
