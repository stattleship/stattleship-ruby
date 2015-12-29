module Stattleship
  class League < OpenStruct
  end

  module LeagueRepresenter
    include Roar::JSON

    property :abbreviation
    property :color
    property :id
    property :minutes_per_period
    property :name
    property :periods
    property :slug
    property :sport
  end
end
