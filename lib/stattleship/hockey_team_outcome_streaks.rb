module Stattleship
  class HockeyTeamOutcomeStreaks < Stattleship::TeamOutcomeStreaks
    HOCKEY_TEAM_OUTCOME_STREAKS = 'hockey/nhl/team_outcome_streaks'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_TEAM_OUTCOME_STREAKS,
            params: params)
    end
  end

  module HockeyTeamOutcomeStreaksRepresenter
    include Roar::JSON
    include TeamOutcomeStreaksRepresenter
  end
end
