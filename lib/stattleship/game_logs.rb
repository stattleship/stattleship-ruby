module Stattleship
  class GameLog < OpenStruct
    def city
      venue.city
    end

    def league_name
      league.name
    end

    def league_abbreviation
      league.abbreviation
    end

    def player_name
      player.name
    end

    def venue
      game.venue
    end
  end

  class GameLogs < Stattleship::Endpoint
    def populate
      game_logs.each do |game_log|
        populate_games(game_log)
        populate_players(game_log)
        populate_player_teams(game_log)
      end
    end
  end

  module GameLogsRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :games, extend: GameRepresenter,
                       class: Game
    collection :leagues, extend: LeagueRepresenter,
                         class: League
    collection :players, extend: PlayerRepresenter,
                         class: Player
    collection :seasons, extend: SeasonRepresenter,
                         class: Season
    collection :teams, extend: TeamRepresenter,
                       class: Team
    collection :venues, extend: VenueRepresenter,
                        class: Venue
  end
end
