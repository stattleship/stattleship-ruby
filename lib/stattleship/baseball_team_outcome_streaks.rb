module Stattleship
  class BaseballTeamOutcomeStreaks < Stattleship::TeamOutcomeStreaks
    BASEBALL_TEAM_OUTCOME_STREAKS = 'baseball/mlb/team_outcome_streaks'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_TEAM_OUTCOME_STREAKS,
            params: params)
    end
  end

  module BaseballTeamOutcomeStreaksRepresenter
    include Roar::JSON
    include TeamOutcomeStreaksRepresenter
  end
end
