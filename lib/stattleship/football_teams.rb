module Stattleship
  class FootballTeams < Stattleship::Teams
    FOOTBALL_TEAMS = 'football/nfl/teams'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_TEAMS,
            params: params)
    end
  end

  module FootballTeamsRepresenter
    include Roar::JSON
    include TeamsRepresenter
  end
end
