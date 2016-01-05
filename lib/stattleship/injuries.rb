module Stattleship
  class Injuries < Stattleship::Endpoint
    def populate
      injuries.each do |injury|
        populate_players(injury)
        populate_season(injury)
        populate_season_league(injury)
        populate_teams(injury)
      end
    end
  end

  module InjuriesRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :injuries, extend: InjuryRepresenter,
                          class: Injury

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :players, extend: PlayerRepresenter,
                         class: Player

    collection :seasons, extend: SeasonRepresenter,
                         class: Season

    collection :teams, extend: TeamRepresenter,
                       class: Team
  end
end
