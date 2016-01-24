module Stattleship
  class Penalties < Stattleship::Endpoint
    def populate
      penalties.each do |penalty|
        populate_games(penalty)

        games.each do |game|
          populate_game(game)
        end

        populate_players(penalty)
        populate_player_teams(penalty)
        populate_opponents(penalty)
      end
    end
  end

  module PenaltiesRepresenter
    include Roar::JSON
    include Stattleship::Models
    include Stattleship::GameLogsRepresenter

    collection :penalties, extend: PenaltyRepresenter,
                           class: Stattleship::Models::Penalty
  end
end
