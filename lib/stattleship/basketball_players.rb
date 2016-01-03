module Stattleship
  class BasketballPlayers < Stattleship::Players
    BASKETBALL_PLAYERS = 'basketball/nba/players'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_PLAYERS,
            params: params)
    end
  end

  module BasketballPlayersRepresenter
    include Roar::JSON
    include PlayersRepresenter
  end
end
