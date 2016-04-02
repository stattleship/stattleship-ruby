module Stattleship
  class FootballTeamGameLog < Stattleship::TeamGameLog
    def stats
      [
        "#{StatFormatter.format(value: team_score)} score",
        "#{StatFormatter.format(value: passing_touchdowns)} Pass TD",
        "#{StatFormatter.format(value: rushing_touchdowns)} Rush TD",
        "#{StatFormatter.format(value: passer_rating, precision: 5)} rating"
      ]
    end

    def to_sentence
      "#{team_name} #{stats.join(', ')} (#{game.name})"
    end
  end

  class FootballTeamGameLogs < Stattleship::TeamGameLogs
    FOOTBALL_TEAM_GAME_LOGS = 'football/nfl/team_game_logs'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_TEAM_GAME_LOGS,
            params: params)
    end
  end

  module FootballTeamGameLogsRepresenter
    include Roar::JSON
    include Roar::Coercion
    include Stattleship::TeamGameLogsRepresenter
    include Virtus.model

    collection :team_game_logs, class: Stattleship::FootballTeamGameLog do

      [
        :away_team_outcome,
        :home_team_outcome,
        :team_outcome,
        :opponent_outcome,
      ].each do |attribute|
        property attribute
      end

      [
        :passer_rating,
        :punting_net_yards_avg,
      ].each do |attribute|
        property attribute, type: BigDecimal
      end

      [
        :home_team_score,
        :away_team_score,
        :team_score,
        :opponent_score,
        :extra_point_kicks_attempted,
        :extra_point_kicks_blocked,
        :extra_point_kicks_succeeded,
        :extra_point_passes_attempted,
        :extra_point_passes_succeeded,
        :extra_point_rushes_attempted,
        :extra_point_rushes_succeeded,
        :field_goals_attempted,
        :field_goals_blocked,
        :field_goals_succeeded,
        :field_goals_succeeded_longest_yards,
        :fourth_downs_attempted,
        :fourth_downs_succeeded,
        :fumble_touchdowns,
        :fumbles,
        :fumbles_lost,
        :fumbles_recovered_defense,
        :fumbles_recovered_offense,
        :games_lost,
        :games_played,
        :games_tied,
        :games_won,
        :goal_to_go_attempted,
        :goal_to_go_succeeded,
        :interception_return_longest_yards,
        :interception_return_yards,
        :interception_returns,
        :interception_touchdowns,
        :kickoff_return_longest_yards,
        :kickoff_return_touchdowns,
        :kickoff_return_yards,
        :kickoff_returns,
        :kickoff_touchbacks,
        :kickoffs,
        :kickoffs_in_end_zone,
        :other_touchdowns,
        :passing_first_downs,
        :passing_gross_yards,
        :passing_longest_yards,
        :passing_net_yards,
        :passing_plays_attempted,
        :passing_plays_completed,
        :passing_plays_intercepted,
        :passing_plays_sacked,
        :passing_sacked_yards,
        :passing_touchdowns,
        :penalties,
        :penalty_first_downs,
        :penalty_yards,
        :points,
        :points_overtime,
        :points_quarter_1,
        :points_quarter_2,
        :points_quarter_3,
        :points_quarter_4,
        :points_overtime_1,
        :points_overtime_2,
        :points_overtime_3,
        :points_overtime_4,
        :points_overtime_5,
        :points_overtime_6,
        :points_overtime_7,
        :points_overtime_8,
        :points_overtime_9,
        :points_overtime_10,
        :punt_blocks,
        :punt_return_faircatches,
        :punt_return_longest_yards,
        :punt_return_touchdowns,
        :punt_return_yards,
        :punt_returns,
        :punting_gross_yards,
        :punting_inside_twenty,
        :punting_longest_gross_yards,
        :punting_longest_net_yards,
        :punting_longest_yards,
        :punting_net_yards,
        :punting_plays,
        :punting_plays_blocked,
        :receiving_longest_yards,
        :red_zone_scores_attempted,
        :red_zone_scores_succeeded,
        :rushing_first_downs,
        :rushing_gross_yards,
        :rushing_longest_yards,
        :rushing_losses,
        :rushing_lost_yards,
        :rushing_net_yards,
        :rushing_plays,
        :rushing_touchdowns,
        :safeties,
        :third_downs_attempted,
        :third_downs_succeeded,
        :time_of_possession_secs,
        :time_of_possession_secs_overtime,
        :time_of_possession_secs_quarter_1,
        :time_of_possession_secs_quarter_2,
        :time_of_possession_secs_quarter_3,
        :time_of_possession_secs_quarter_4,
        :total_first_downs,
        :total_touchdowns,
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
