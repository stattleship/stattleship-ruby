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
        populate_opponents(team_game_log)
        populate_teams(team_game_log)
      end
    end
  end

  module TeamGameLogsRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :games, extend: GameRepresenter,
                       class: Game

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :seasons, extend: SeasonRepresenter,
                         class: Season

    collection :opponents, extend: TeamRepresenter,
                           class: Team

    collection :teams, extend: TeamRepresenter,
                       class: Team

    collection :venues, extend: VenueRepresenter,
                        class: Venue
  end
end
