module Stattleship
  module Models
    class League < OpenStruct
    end

    module LeagueRepresenter
      include Roar::JSON
      include Roar::Coercion

      property :abbreviation
      property :color
      property :id
      property :minutes_per_period, type: Integer
      property :name
      property :periods, type: Integer
      property :slug
      property :sport
    end
  end
end
