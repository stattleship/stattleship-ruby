module Stattleship
  class BasketballTeamOutcomeStreaks < Stattleship::TeamOutcomeStreaks
    BASKETBALL_TEAM_OUTCOME_STREAKS = 'basketball/nba/team_outcome_streaks'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_TEAM_OUTCOME_STREAKS,
            params: params)
    end
  end

  module BasketballTeamOutcomeStreaksRepresenter
    include Roar::JSON
    include TeamOutcomeStreaksRepresenter
  end
end
