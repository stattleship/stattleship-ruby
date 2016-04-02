module Stattleship
  class HockeyTeamGameLog < Stattleship::TeamGameLog
    def stats
      [
        "#{StatFormatter.format(value: goals)} G",
        "#{StatFormatter.format(value: penalty_minutes)} PIM",
        "#{StatFormatter.format(value: player_points)} P",
        "#{StatFormatter.format(value: shots)} S"
      ]
    end

    def to_sentence
      "#{team_name} #{stats.join(', ')} (#{game.name})"
    end
  end

  class HockeyTeamGameLogs < Stattleship::TeamGameLogs
    HOCKEY_TEAM_GAME_LOGS = 'hockey/nhl/team_game_logs'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_TEAM_GAME_LOGS,
            params: params)
    end
  end

  module HockeyTeamGameLogsRepresenter
    include Roar::JSON
    include Roar::Coercion
    include Stattleship::TeamGameLogsRepresenter
    include Virtus.model

    collection :team_game_logs, class: Stattleship::HockeyTeamGameLog do

      [
        :home_team_outcome,
        :away_team_outcome,
        :team_outcome,
        :opponent_outcome,
      ].each do |attribute|
        property attribute
      end


      property :goalie_goals_against_average, type: BigDecimal

      [
        :home_team_score,
        :away_team_score,
        :team_score,
        :opponent_score,
        :faceoff_total_losses,
        :faceoff_total_wins,
        :games_lost,
        :games_lost_overtime,
        :games_lost_shootout,
        :games_tied,
        :games_won,
        :games_won_overtime,
        :games_won_shootout,
        :goalie_assists,
        :goalie_goals_against,
        :goalie_goals_scored,
        :goalie_hits,
        :goalie_penalty_minutes,
        :goalie_points_power_play,
        :goalie_points_short_handed,
        :goalie_saves,
        :goalie_shots_against,
        :goalie_time_on_ice_power_play_secs,
        :goalie_time_on_ice_secs,
        :goalie_time_on_ice_short_handed_secs,
        :goals,
        :goals_empty_net,
        :goals_overtime,
        :goals_overtime_1,
        :goals_overtime_2,
        :goals_overtime_3,
        :goals_period_1,
        :goals_period_2,
        :goals_period_3,
        :goals_power_play,
        :goals_shootout,
        :penalties,
        :penalty_minutes,
        :player_assists,
        :player_blocked_shots,
        :player_game_winning_goals,
        :player_hits,
        :player_plus_minus,
        :player_points,
        :player_points_power_play,
        :player_points_short_handed,
        :player_time_on_ice_power_play_secs,
        :player_time_on_ice_short_handed_secs,
        :power_plays,
        :shootouts_attempted,
        :shootouts_scored,
        :shots,
        :shots_overtime,
        :shots_overtime_1,
        :shots_overtime_2,
        :shots_overtime_3,
        :shots_period_1,
        :shots_period_2,
        :shots_period_3,
        :shutouts,
        :total_play_time,
      ].each do |attribute|
        property attribute, type: Integer
      end

      [
        :is_home_team,
        :is_away_team,
      ].each do |attribute|
        property attribute, type: Boolean, default: false
      end

      [
        :game_id,
        :opponent_id,
        :team_id,
      ].each do |relationship|
        property relationship
      end
    end
  end
end
