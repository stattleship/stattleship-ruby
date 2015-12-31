module Stattleship
  class HockeyGameLog < Stattleship::GameLog
    def stats
      [
        "#{goals.to_i} G",
        "#{assists.to_i} A",
        "#{points.to_i} P",
        "#{shots.to_i} S",
        "#{hits.to_i} H",
        "#{goals_power_play.to_i} PPG"
      ]
    end

    def to_sentence
      "#{player_name} #{stats.join(', ')} (#{game.name})"
    end
  end

  class HockeyGameLogs < Stattleship::GameLogs
    HOCKEY_GAME_LOGS = 'hockey/nhl/game_logs'.freeze

    def self.fetch(team_id:)
      super(path: HOCKEY_GAME_LOGS,
            team_id: team_id)
    end
  end

  module HockeyGameLogsRepresenter
    include Roar::JSON
    include Stattleship::GameLogsRepresenter

    collection :game_logs, class: Stattleship::HockeyGameLog do
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
        :blocked_shots,
        :faceoffs_won,
        :faceoffs_lost,
        :faceoff_win_percentage,
        :goals,
        :goals_power_play,
        :goals_short_handed,
        :hits,
        :penalty_minutes,
        :plus_minus,
        :points,
        :points_power_play,
        :shifts,
        :shooting_pct,
        :shots,
        :takeaways,
        :time_on_ice_secs,
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
