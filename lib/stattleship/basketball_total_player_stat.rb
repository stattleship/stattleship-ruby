module Stattleship
  class BasketballTotalPlayerStat < Stattleship::TotalPlayerStat
    BASKETBALL_TOTAL_PLAYER_STAT = 'basketball/nba/total_stats'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_TOTAL_PLAYER_STAT,
            params: params).
      first
    end
  end

  module BasketballTotalPlayerStatRepresenter
    include Roar::JSON
    include TotalPlayerStatRepresenter
  end
end
