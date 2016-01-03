module Stattleship
  class BasketballTotalTeamStat < Stattleship::TotalTeamStat
    BASKETBALL_TOTAL_TEAM_STAT = 'basketball/nba/total_stats'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_TOTAL_TEAM_STAT,
            params: params)
    end
  end

  module BasketballTotalTeamStatRepresenter
    include Roar::JSON
    include TotalTeamStatRepresenter
  end
end
