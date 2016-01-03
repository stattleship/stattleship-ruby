module Stattleship
  class FootballPlayers < Stattleship::Players
    FOOTBALL_PLAYERS = 'football/nfl/players'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_PLAYERS,
            params: params)
    end
  end

  module FootballPlayersRepresenter
    include Roar::JSON
    include PlayersRepresenter
  end
end
