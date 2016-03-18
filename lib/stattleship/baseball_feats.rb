module Stattleship
  class BaseballFeats < Stattleship::Feats
    BASEBALL_FEATS = 'baseball/mlb/feats'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_FEATS,
            params: params)
    end
  end

  module BaseballFeatsRepresenter
    include Roar::JSON
    include FeatsRepresenter
  end
end
