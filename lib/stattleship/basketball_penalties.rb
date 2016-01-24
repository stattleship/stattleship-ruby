module Stattleship
  class BasketballPenalties < Stattleship::Penalties
    BASKETBALL_PENALTIES = 'basketball/nba/penalties'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_PENALTIES,
            params: params)
    end
  end

  module BasketballPenaltiesRepresenter
    include Roar::JSON
    include PenaltiesRepresenter
  end
end
