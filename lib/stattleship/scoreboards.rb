module Stattleship
  class Scoreboards < Stattleship::Endpoint
    def populate
      scoreboards.each do |scoreboard|
        populate_games(scoreboard)

        games.each do |game|
          populate_game(game)
        end

        populate_teams(scoreboard)
        populate_opponents(scoreboard)
      end
    end
  end

  module ScoreboardsRepresenter
    include Roar::JSON
    include Stattleship::Models
    include Stattleship::GameLogsRepresenter

    collection :scoreboards, extend: ScoreboardRepresenter,
                               class: Stattleship::Models::Scoreboard

  end
end
