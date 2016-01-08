module Stattleship
  module Models
    class Season < OpenStruct
    end

    module SeasonRepresenter
      include Roar::JSON
      include Roar::Coercion

      property :ends_on, type: Date
      property :id
      property :league_id
      property :name
      property :slug
      property :starts_on, type: Date
    end
  end
end
