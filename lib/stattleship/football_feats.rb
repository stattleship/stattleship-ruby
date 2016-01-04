module Stattleship
  class FootballFeats < Stattleship::Feats
    FOOTBALL_FEATS = 'football/nfl/feats'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_FEATS,
            params: params)
    end
  end

  module FootballFeatsRepresenter
    include Roar::JSON
    include FeatsRepresenter
  end
end
