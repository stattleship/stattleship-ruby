module Stattleship
  class BaseballTopStats < Stattleship::TopStats
    BASEBALL_TOP_STATS = 'baseball/mlb/top_stats'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_TOP_STATS,
            params: params)
    end
  end

  module BaseballTopStatsRepresenter
    include Roar::JSON
    include TopStatsRepresenter
  end
end
