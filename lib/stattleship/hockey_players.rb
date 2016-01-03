module Stattleship
  class HockeyPlayers < Stattleship::Players
    HOCKEY_PLAYERS = 'hockey/nhl/players'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_PLAYERS,
            params: params)
    end
  end

  module HockeyPlayersRepresenter
    include Roar::JSON
    include PlayersRepresenter
  end
end
