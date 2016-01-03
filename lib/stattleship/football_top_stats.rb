module Stattleship
  class FootballTopStats < Stattleship::TopStats
    FOOTBALL_TOP_STATS = 'football/nfl/top_stats'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_TOP_STATS,
            params: params)
    end
  end

  module FootballTopStatsRepresenter
    include Roar::JSON
    include TopStatsRepresenter
  end
end
