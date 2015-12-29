module Stattleship
  class Team < OpenStruct
    def full_name
      "#{location} #{nickname}"
    end
  end

  module TeamRepresenter
    include Roar::JSON

    property :id
    property :location
    property :name
    property :nickname
    property :slug
  end
end
