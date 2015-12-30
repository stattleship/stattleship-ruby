module Stattleship
  module Models
    class Season < OpenStruct
    end

    module SeasonRepresenter
      include Roar::JSON

      property :ends_on
      property :id
      property :league_id
      property :name
      property :slug
      property :starts_on
    end
  end
end
