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

  class GameLogs < OpenStruct
    def stats
      @game_logs ||= hydrate
    end

    def hydrate
      game_logs.each do |game_log|
        hydrate_games(game_log)
        hydrate_players(game_log)
        hydrate_teams(game_log)
      end
    end

    def hydrate_games(model)
      model.game = games.detect do |game|
        game.id == model.game_id
      end

      hydrate_season(model.game)
      hydrate_league(model.game.season)
      hydrate_venue(model.game)

      model.game.league = model.game.season.league
      model.league = model.game.league
    end

    def hydrate_season(model)
      model.season = seasons.detect do |season|
        season.id == model.season_id
      end
    end

    def hydrate_league(model)
      model.league = leagues.detect do |league|
        league.id == model.league_id
      end
    end

    def hydrate_venue(model)
      model.venue = venues.detect do |venue|
        venue.id == model.venue_id
      end
    end

    def hydrate_players(model)
      model.player = players.detect do |player|
        player.id == model.player_id
      end
    end

    def hydrate_teams(model)
      model.team = teams.detect do |team|
        team.id == model.player.team_id
      end
    end
  end
end
