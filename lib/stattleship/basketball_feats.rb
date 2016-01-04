module Stattleship
  class BasketballFeats < Stattleship::Feats
    BASKETBALL_FEATS = 'basketball/nba/feats'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_FEATS,
            params: params)
    end
  end

  module BasketballFeatsRepresenter
    include Roar::JSON
    include FeatsRepresenter
  end
end
