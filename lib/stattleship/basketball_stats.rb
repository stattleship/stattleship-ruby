module Stattleship
  class BasketballStats < Stattleship::Stats
    BASKETBALL_STATS = 'basketball/nba/stats'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_STATS,
            params: params)
    end
  end

  module BasketballStatsRepresenter
    include Roar::JSON
    include StatsRepresenter
  end
end
