module Stattleship
  class Team < OpenStruct
  end

  module TeamRepresenter
    include Roar::JSON

    property :locations
    property :name
    property :nickname
    property :id
  end
end
