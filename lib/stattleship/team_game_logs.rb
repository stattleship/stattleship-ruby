module Stattleship
  class TeamGameLog < OpenStruct
    def city
      venue.city
    end

    def league_name
      league.name
    end

    def league_abbreviation
      league.abbreviation
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

  class TeamGameLogs < Stattleship::Endpoint
    def populate
      team_game_logs.each do |team_game_log|
        populate_games(team_game_log)

        games.each do |game|
          populate_game(game)
        end

        populate_opponents(team_game_log)
        populate_officials(team_game_log)
        populate_teams(team_game_log)
      end
    end
  end

  module TeamGameLogsRepresenter
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

    collection :seasons, extend: SeasonRepresenter,
                         class: Season

    collection :officials, extend: OfficialRepresenter,
                           class: Official

    collection :opponents, extend: TeamRepresenter,
                           class: Team

    collection :teams, extend: TeamRepresenter,
                       class: Team

    collection :venues, extend: VenueRepresenter,
                        class: Venue
  end
end
