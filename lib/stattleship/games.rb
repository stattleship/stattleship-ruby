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

    collection :games, extend: GameRepresenter,
                       class: Game

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :seasons, extend: SeasonRepresenter,
                         class: Season

    collection :venues, extend: VenueRepresenter,
                        class: Venue
 end
end
