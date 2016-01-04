module Stattleship
  class FootballStats < Stattleship::Stats
    FOOTBALL_STATS = 'football/nfl/stats'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_STATS,
            params: params)
    end
  end

  module FootballStatsRepresenter
    include Roar::JSON
    include StatsRepresenter
  end
end
