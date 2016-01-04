module Stattleship
  class Players < Stattleship::Endpoint
    def populate
      players.each do |player|
        populate_player(player)
      end
    end
  end

  module PlayersRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :players, extend: PlayerRepresenter,
                         class: Player

    collection :playing_positions, extend: PlayingPositionRepresenter,
                                   class: PlayingPosition

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :teams, extend: TeamRepresenter,
                       class: Team
  end
end
