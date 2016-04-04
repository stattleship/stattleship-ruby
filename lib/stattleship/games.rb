module Stattleship
  class Games < Stattleship::Endpoint
    def populate
      games.each do |game|
        populate_game(game)
      end
    end
  end

  module GamesRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :away_teams, extend: TeamRepresenter,
                            class: Team

    collection :home_teams, extend: TeamRepresenter,
                            class: Team

    collection :winning_teams, extend: TeamRepresenter,
                               class: Team

    collection :games, extend: GameRepresenter,
                       class: Game

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :officials, extend: OfficialRepresenter,
                           class: Official

    collection :seasons, extend: SeasonRepresenter,
                         class: Season

    collection :venues, extend: VenueRepresenter,
                        class: Venue
  end
end
