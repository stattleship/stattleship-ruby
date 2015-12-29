module Stattleship
  class BasketballGameLog < OpenStruct
  end

  class BasketballGameLogs < OpenStruct
    def stats
      @game_logs ||= hydrate
    end

    def hydrate
      game_logs.each do |game_log|
        hydrate_players(game_log)
        hydrate_teams(game_log)
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

  module BasketballGameLogsRepresenter
    include Roar::JSON

    collection :game_logs, class: Stattleship::BasketballGameLog do
      [
        :game_played,
        :game_started,
        :home_team_outcome,
        :home_team_score,
        :away_team_outcome,
        :away_team_score,
        :team_outcome,
        :team_score,
        :assists,
        :field_goals_attempted,
        :field_goals_made,
        :field_goals_pct,
        :free_throws_attempted,
        :free_throws_made,
        :free_throws_pct,
        :points,
        :three_pointers_attempted,
        :three_pointers_made,
        :three_pointers_pct,
        :turnovers,
        :steals,
        :blocks,
        :personal_fouls,
        :technical_fouls,
        :time_played_total,
        :plus_minus,
        :disqualifications,
        :rebounds_defensive,
        :rebounds_offensive,
        :rebounds_total,
        :double_double,
        :double_triple_double,
        :double_twenty,
        :five_by_five,
        :five_by_seven,
        :five_by_six,
        :five_by_steals_blocks,
        :quadruple_double,
        :quintuple_double,
        :thirty_thirty,
        :triple_double,
        ].each do |attribute|
          property attribute
        end

        [
          :player_id,
          :game_id,
          :team_id
          ].each do |relationship|
          property relationship
        end
    end

    collection :players, extend: Stattleship::PlayerRepresenter,
                         class: Stattleship::Player
    collection :teams, extend: Stattleship::TeamRepresenter,
                       class: Stattleship::Team
  end
end
