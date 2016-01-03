module Stattleship
  module Models
    class PlayingPosition < OpenStruct
    end

    module PlayingPositionRepresenter
      include Roar::JSON

      property :abbreviation
      property :description
      property :formation
      property :id
      property :league_id
      property :name
    end
  end
end
