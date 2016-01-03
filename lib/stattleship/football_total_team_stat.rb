module Stattleship
  class FootballTotalTeamStat < Stattleship::TotalTeamStat
    FOOTBALL_TOTAL_TEAM_STAT = 'football/nfl/total_stats'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_TOTAL_TEAM_STAT,
            params: params)
    end
  end

  module FootballTotalTeamStatRepresenter
    include Roar::JSON
    include TotalTeamStatRepresenter
  end
end
