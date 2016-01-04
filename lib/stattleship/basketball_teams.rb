module Stattleship
  class BasketballTeams < Stattleship::Teams
    BASKETBALL_TEAMS = 'basketball/nba/teams'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_TEAMS,
            params: params)
    end
  end

  module BasketballTeamsRepresenter
    include Roar::JSON
    include TeamsRepresenter
  end
end
