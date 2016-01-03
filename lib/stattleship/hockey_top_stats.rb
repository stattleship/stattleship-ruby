module Stattleship
  class HockeyTopStats < Stattleship::TopStats
    HOCKEY_TOP_STATS = 'hockey/nhl/top_stats'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_TOP_STATS,
            params: params)
    end
  end

  module HockeyTopStatsRepresenter
    include Roar::JSON
    include TopStatsRepresenter
  end
end
