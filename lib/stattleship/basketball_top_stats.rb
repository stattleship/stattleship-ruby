module Stattleship
  class BasketballTopStats < Stattleship::TopStats
    BASKETBALL_TOP_STATS = 'basketball/nba/top_stats'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_TOP_STATS,
            params: params)
    end
  end

  module BasketballTopStatsRepresenter
    include Roar::JSON
    include TopStatsRepresenter
  end
end
