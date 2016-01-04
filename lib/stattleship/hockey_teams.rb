module Stattleship
  class HockeyTeams < Stattleship::Teams
    HOCKEY_TEAMS = 'hockey/nhl/teams'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_TEAMS,
            params: params)
    end
  end

  module HockeyTeamsRepresenter
    include Roar::JSON
    include TeamsRepresenter
  end
end
