module Stattleship
  class HockeyTotalPlayerStat < Stattleship::TotalPlayerStat
    HOCKEY_TOTAL_PLAYER_STAT = 'hockey/nhl/total_stats'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_TOTAL_PLAYER_STAT,
            params: params)
    end
  end

  module HockeyTotalPlayerStatRepresenter
    include Roar::JSON
    include TotalPlayerStatRepresenter
  end
end
