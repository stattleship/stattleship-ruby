module Stattleship
  class Teams < Stattleship::Endpoint
    def populate
      teams.each do |team|
        populate_team(team)
      end
    end
  end

  module TeamsRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :teams, extend: TeamRepresenter,
                       class: Team
  end
end
