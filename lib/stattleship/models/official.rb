module Stattleship
  module Models
    class Official < OpenStruct
    end

    module OfficialRepresenter
      include Roar::JSON
      include Roar::Coercion
      include Virtus.model

      property :id
      property :first_name
      property :last_name
      property :name
      property :role
      property :role_label
      property :uniform_number
    end
  end
end
