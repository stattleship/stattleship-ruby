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

    def self.fetch(params:)
      super(path: HOCKEY_GAME_LOGS,
            params: params)
    end
  end

  module HockeyGameLogsRepresenter
    include Roar::JSON
    include Roar::Coercion
    include Stattleship::GameLogsRepresenter
    include Virtus.model

    collection :game_logs, class: Stattleship::HockeyGameLog do
      [
        :game_played,
        :game_started,
        :home_team_outcome,
        :away_team_outcome,
        :team_outcome,
        :opponent_outcome,
      ].each do |attribute|
        property attribute
      end

      [
        :away_team_score,
        :home_team_score,
        :team_score,
        :opponent_score,
        :assists,
        :blocked_shots,
        :faceoffs_won,
        :faceoffs_lost,
        :goals,
        :goals_power_play,
        :goals_short_handed,
        :hits,
        :penalty_minutes,
        :plus_minus,
        :points,
        :points_power_play,
        :shifts,
        :shots,
        :takeaways,
        :time_on_ice_secs,
        :time_on_ice_even_strength_secs,
        :time_on_ice_power_play_secs,
        :time_on_ice_short_handed_secs,
        :assists_power_play,
        :assists_short_handed,
        :game_winning_goals,
        :goals_overtime,
        :goals_period_1,
        :goals_period_2,
        :goals_period_3,
        :points_short_handed,
        :shootouts_attempted,
        :shootouts_scored
      ].each do |attribute|
        property attribute, type: Integer
      end

      [
        :faceoff_win_percentage,
        :shooting_pct,
      ].each do |attribute|
        property attribute, type: BigDecimal
      end

      [
        :is_home_team,
        :is_away_team,
      ].each do |attribute|
        property attribute, type: Boolean, default: false
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
