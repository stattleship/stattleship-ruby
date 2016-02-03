module Stattleship
  module Models
    class Venue < OpenStruct
      def dump
        self.to_hash
      end
    end

    module VenueRepresenter
      include Roar::JSON
      include Roar::Coercion

      property :abbreviation
      property :capacity, type: Integer
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
end
