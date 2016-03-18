module Stattleship
  class BaseballTotalPlayerStat < Stattleship::TotalPlayerStat
    BASEBALL_TOTAL_PLAYER_STAT = 'baseball/mlb/total_stats'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_TOTAL_PLAYER_STAT,
            params: params)
    end
  end

  module BaseballTotalPlayerStatRepresenter
    include Roar::JSON
    include TotalPlayerStatRepresenter
  end
end
