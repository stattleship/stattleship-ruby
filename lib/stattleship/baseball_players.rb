module Stattleship
  class BaseballPlayers < Stattleship::Players
    BASEBALL_PLAYERS = 'baseball/mlb/players'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_PLAYERS,
            params: params)
    end
  end

  module BaseballPlayersRepresenter
    include Roar::JSON
    include PlayersRepresenter
  end
end
