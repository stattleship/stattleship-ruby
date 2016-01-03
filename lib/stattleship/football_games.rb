module Stattleship
  class FootballGames < Stattleship::Games
    FOOTBALL_GAMES = 'football/nfl/games'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_GAMES,
            params: params)
    end
  end

  module FootballGamesRepresenter
    include Roar::JSON
    include GamesRepresenter
  end
end
