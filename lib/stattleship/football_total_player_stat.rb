module Stattleship
  class FootballTotalPlayerStat < Stattleship::TotalPlayerStat
    FOOTBALL_TOTAL_PLAYER_STAT = 'football/nfl/total_stats'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_TOTAL_PLAYER_STAT,
            params: params)
    end
  end

  module FootballTotalPlayerStatRepresenter
    include Roar::JSON
    include TotalPlayerStatRepresenter
  end
end
