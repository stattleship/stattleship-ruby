module Stattleship
  class BaseballGames < Stattleship::Games
    BASEBALL_GAMES = 'baseball/mlb/games'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_GAMES,
            params: params)
    end
  end

  module BaseballGamesRepresenter
    include Roar::JSON
    include GamesRepresenter
  end
end
