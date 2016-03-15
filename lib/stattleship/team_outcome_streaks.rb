module Stattleship
  class TeamOutcomeStreaks < Stattleship::Endpoint
    def populate
      team_outcome_streaks.each do |team_outcome_streak|
        populate_league(team_outcome_streak)
        populate_season(team_outcome_streak)
        populate_teams(team_outcome_streak)
      end
    end
  end

  module TeamOutcomeStreaksRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :team_outcome_streaks, extend: TeamOutcomeStreakRepresenter,
                                      class: TeamOutcomeStreak

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :seasons, extend: SeasonRepresenter,
                         class: Season

    collection :teams, extend: TeamRepresenter,
                       class: Team
  end
end
