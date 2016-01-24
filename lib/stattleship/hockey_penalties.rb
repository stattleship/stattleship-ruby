module Stattleship
  class HockeyPenalties < Stattleship::Penalties
    HOCKEY_PENALTIES = 'hockey/nhl/penalties'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_PENALTIES,
            params: params)
    end
  end

  module HockeyPenaltiesRepresenter
    include Roar::JSON
    include PenaltiesRepresenter
  end
end
