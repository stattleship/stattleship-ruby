module Stattleship
  class FootballTeamOutcomeStreaks < Stattleship::TeamOutcomeStreaks
    FOOTBALL_TEAM_OUTCOME_STREAKS = 'football/nfl/team_outcome_streaks'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_TEAM_OUTCOME_STREAKS,
            params: params)
    end
  end

  module FootballTeamOutcomeStreakRepresenter
    include Roar::JSON
    include TeamOutcomeStreaksRepresenter
  end
end
