module Stattleship
  class Venue < OpenStruct
  end

  module VenueRepresenter
    include Roar::JSON

    property :abbreviation
    property :city
    property :country
    property :field_type
    property :id
    property :name
    property :slug
    property :state
    property :time_zone
  end
end
