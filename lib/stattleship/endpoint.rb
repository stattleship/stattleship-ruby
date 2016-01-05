module Stattleship
  class Endpoint < OpenStruct
    def self.fetch(path:, params:)
      Stattleship::Client.new(path: path,
                              query: params.query).
        paginate(model: self)
    end

    def data
      @data ||= populate
    end

    def populate
      raise 'Endpoint subclass must implement populate'
    end

    private

    def populate_opponents(model)
      return if opponents.nil?

      model.opponent = opponents.detect do |opponent|
        opponent.id == model.opponent_id
      end
    end

    def populate_players(model)
      return if players.nil?

      model.player = players.detect do |player|
        player.id == model.player_id
      end
    end

    def populate_player_teams(model)
      return if teams.nil?

      model.team = teams.detect do |team|
        team.id == model.player.team_id
      end

      if model.player
        model.player.team = model.team
        populate_player_playing_position(model.player)
      end
    end

    def populate_player(player)
      populate_player_team(player)
    end

    def populate_player_team(player)
      return if player.nil?
      return if teams.nil?

      player.team = teams.detect do |team|
        team.id == player.team_id
      end
    end

    def populate_player_playing_position(model)
      return if playing_positions.nil?

      model.playing_position = playing_positions.detect do |playing_position|
        playing_position.id == model.player.playing_position_id
      end
    end

    def populate_games(model)
      return if games.nil?

      model.game = games.detect do |game|
        game.id == model.game_id
      end

      populate_model_game(model)
    end

    def populate_game(game)
      populate_away_team(game)
      populate_home_team(game)
      populate_winning_team(game)
      populate_season(game)
      populate_venue(game)

      if game && game.season
        populate_league(game.season)
        game.league = game.season.league
      end
    end

    def populate_model_game(model)
      populate_season(model.game)
      populate_venue(model.game)

      if model.game && model.game.season
        populate_league(model.game.season)
        model.game.league = model.game.season.league
      end

      if model.game && model.game.league
        model.league = model.game.league
      end
    end

    def populate_season(model)
      return if seasons.nil?

      model.season = seasons.detect do |season|
        season.id == model.season_id
      end
    end

    def populate_league(model)
      return if leagues.nil?

      model.league = leagues.detect do |league|
        league.id == model.league_id
      end
    end

    def populate_team(team)
      populate_league(team)
    end

    def populate_away_team(model)
      return if away_teams.nil?
      model.away_team = away_teams.detect do |away_team|
        away_team.id == model.away_team_id
      end
    end

    def populate_home_team(model)
      return if home_teams.nil?

      model.home_team = home_teams.detect do |home_team|
        home_team.id == model.home_team_id
      end
    end

    def populate_winning_team(model)
      return if winning_teams.nil?

      model.winning_team = winning_teams.detect do |winning_team|
        winning_team.id == model.winning_team_id
      end
    end

    def populate_teams(model)
      return if teams.nil?

      model.team = teams.detect do |team|
        team.id == model.team_id
      end
    end

    def populate_venue(model)
      return if venues.nil?

      model.venue = venues.detect do |venue|
        venue.id == model.venue_id
      end
    end
  end
end
