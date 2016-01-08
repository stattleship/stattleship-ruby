module Stattleship
  module Models
    class Injury < OpenStruct
    end

    module InjuryRepresenter
      include Roar::JSON
      include Roar::Coercion

      property :id
      property :location_name
      property :note
      property :player_id
      property :season_id
      property :started_on, type: Date
      property :status
      property :status_label
      property :status_updated_at, type: DateTime
      property :team_id
    end
  end
end
