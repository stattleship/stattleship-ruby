module Stattleship
  class BasketballGameLog < Stattleship::GameLog
    def stats
      [
        "#{field_goals_made.to_i} FGM",
        "#{(field_goals_pct.to_f * 100).round(1)} FG%",
        "#{points.to_i} PTS",
        "#{rebounds_defensive.to_i} DRB",
        "#{rebounds_offensive.to_i} ORB",
        "#{rebounds_total} REB"
      ]
    end

    def to_sentence
      "#{player_name} #{stats.join(', ')} (#{game.name})"
    end
  end

  class BasketballGameLogs < Stattleship::GameLogs
    BASKETBALL_GAME_LOGS = 'basketball/nba/game_logs'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_GAME_LOGS,
            params: params)
    end
  end

  module BasketballGameLogsRepresenter
    include Roar::JSON
    include Stattleship::GameLogsRepresenter

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
  end
end
