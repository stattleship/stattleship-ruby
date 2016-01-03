module Stattleship
  class BasketballGames < Stattleship::Games
    BASKETBALL_GAMES = 'basketball/nba/games'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_GAMES,
            params: params)
    end
  end

  module BasketballGamesRepresenter
    include Roar::JSON
    include GamesRepresenter
  end
end
