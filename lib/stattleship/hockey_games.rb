module Stattleship
  class HockeyGames < Stattleship::Games
    HOCKEY_GAMES = 'hockey/nhl/games'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_GAMES,
            params: params)
    end
  end

  module HockeyGamesRepresenter
    include Roar::JSON
    include GamesRepresenter
  end
end
