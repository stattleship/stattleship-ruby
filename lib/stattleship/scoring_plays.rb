module Stattleship
  class ScoringPlays < Stattleship::Endpoint
    def populate
      scoring_plays.each do |scoring_play|
        populate_games(scoring_play)

        games.each do |game|
          populate_game(game)
        end

        populate_teams(scoring_play)
        populate_opponents(scoring_play)

        populate_scoring_players(scoring_play)
      end
    end
  end

  module ScoringPlaysRepresenter
    include Roar::JSON
    include Stattleship::Models
    include Stattleship::GameLogsRepresenter

    collection :scoring_plays, extend: ScoringPlayRepresenter,
                               class: Stattleship::Models::ScoringPlay

    collection :scoring_players, extend: ScoringPlayerRepresenter,
                                 class: ScoringPlayer
  end
end
