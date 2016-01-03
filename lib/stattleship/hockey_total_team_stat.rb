module Stattleship
  class HockeyTotalTeamStat < Stattleship::TotalTeamStat
    HOCKEY_TOTAL_TEAM_STAT = 'hockey/nhl/total_stats'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_TOTAL_TEAM_STAT,
            params: params)
    end
  end

  module HockeyTotalTeamStatRepresenter
    include Roar::JSON
    include TotalTeamStatRepresenter
  end
end
