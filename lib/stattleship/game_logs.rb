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

    def opponent_name
      opponent.name
    end

    def opponent_full_name
      opponent.full_name
    end

    def scoreline
      game.scoreline
    end

    def team_name
      team.name
    end

    def team_full_name
      team.full_name
    end

    def venue
      game.venue
    end
  end

  class GameLogs < Stattleship::Endpoint
    def populate
      game_logs.each do |game_log|
        populate_games(game_log)

        games.each do |game|
          populate_game(game)
        end

        populate_players(game_log)
        populate_player_teams(game_log)
        populate_opponents(game_log)
      end
    end
  end

  module GameLogsRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :away_teams, extend: TeamRepresenter,
                            class: Team

    collection :home_teams, extend: TeamRepresenter,
                            class: Team

    collection :winning_teams, extend: TeamRepresenter,
                               class: Team

    collection :games, extend: GameRepresenter,
                       class: Game

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :officials, extend: OfficialRepresenter,
                           class: Official

    collection :opponents, extend: TeamRepresenter,
                           class: Team

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
