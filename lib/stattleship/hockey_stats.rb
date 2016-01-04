module Stattleship
  class HockeyStats < Stattleship::Stats
    HOCKEY_STATS = 'hockey/nhl/stats'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_STATS,
            params: params)
    end
  end

  module HockeyStatsRepresenter
    include Roar::JSON
    include StatsRepresenter
  end
end
