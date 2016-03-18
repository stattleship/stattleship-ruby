module Stattleship
  class BaseballTotalTeamStat < Stattleship::TotalTeamStat
    BASEBALL_TOTAL_TEAM_STAT = 'baseball/mlb/total_stats'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_TOTAL_TEAM_STAT,
            params: params)
    end
  end

  module BaseballTotalTeamStatRepresenter
    include Roar::JSON
    include TotalTeamStatRepresenter
  end
end
