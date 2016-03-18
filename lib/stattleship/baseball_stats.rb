module Stattleship
  class BaseballStats < Stattleship::Stats
    BASEBALL_STATS = 'baseball/mlb/stats'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_STATS,
            params: params)
    end
  end

  module BaseballStatsRepresenter
    include Roar::JSON
    include StatsRepresenter
  end
end
