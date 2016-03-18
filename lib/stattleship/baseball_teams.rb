module Stattleship
  class BaseballTeams < Stattleship::Teams
    BASEBALL_TEAMS = 'baseball/mlb/teams'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_TEAMS,
            params: params)
    end
  end

  module BaseballTeamsRepresenter
    include Roar::JSON
    include TeamsRepresenter
  end
end
