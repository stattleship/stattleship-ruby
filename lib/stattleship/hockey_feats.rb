module Stattleship
  class HockeyFeats < Stattleship::Feats
    HOCKEY_FEATS = 'hockey/nhl/feats'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_FEATS,
            params: params)
    end
  end

  module HockeyFeatsRepresenter
    include Roar::JSON
    include FeatsRepresenter
  end
end
