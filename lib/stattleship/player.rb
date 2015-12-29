module Stattleship
  class Player < OpenStruct
  end

  module PlayerRepresenter
    include Roar::JSON

    property :id
    property :first_name
    property :last_name
    property :name
    property :position_name
    property :team_id
  end
end
