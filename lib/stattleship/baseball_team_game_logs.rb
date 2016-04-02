module Stattleship
  class BaseballTeamGameLog < Stattleship::TeamGameLog
    def stats
      [
        "#{hits.to_i} H",
        "#{runs.to_i} R",
        "#{runs_batted_in.to_i} RBI",
        "#{errors_made} E"
      ]
    end

    def to_sentence
      "#{team_name} #{stats.join(', ')} (#{game.name})"
    end
  end

  class BaseballTeamGameLogs < Stattleship::TeamGameLogs
    BASEBALL_TEAM_GAME_LOGS = 'baseball/mlb/team_game_logs'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_TEAM_GAME_LOGS,
            params: params)
    end
  end

  module BaseballTeamGameLogsRepresenter
    include Roar::JSON
    include Roar::Coercion
    include Stattleship::TeamGameLogsRepresenter
    include Virtus.model

    collection :team_game_logs, class: Stattleship::BaseballTeamGameLog do

      [
        :away_team_outcome,
        :home_team_outcome,
        :team_outcome,
        :opponent_outcome,
      ].each do |attribute|
        property attribute
      end

      [
        :batting_average,
        :earned_run_average,
        :earned_runs_against,
        :on_base_percentage,
        :on_base_plus_slugging,
        :slugging_percentage,
      ].each do |attribute|
        property attribute, type: BigDecimal
      end

      [
        :home_team_score,
        :away_team_score,
        :team_score,
        :opponent_score,
        :at_bats,
        :balks,
        :caught_stealing,
        :complete_games,
        :double_plays,
        :doubles,
        :errors_made,
        :games_lost,
        :games_played,
        :games_won,
        :grounded_into_double_plays,
        :hit_batters,
        :hit_by_pitch,
        :hits,
        :home_runs,
        :intentional_walks,
        :intentional_walks_against,
        :left_on_base,
        :outs_pitched,
        :passed_balls,
        :pickoffs,
        :rlisp_two_out,
        :runs,
        :runs_batted_in,
        :runs_inning_1,
        :runs_inning_2,
        :runs_inning_3,
        :runs_inning_4,
        :runs_inning_5,
        :runs_inning_6,
        :runs_inning_7,
        :runs_inning_8,
        :runs_inning_9,
        :runs_inning_10,
        :runs_inning_11,
        :runs_inning_12,
        :runs_inning_13,
        :runs_inning_14,
        :runs_inning_15,
        :runs_inning_16,
        :runs_inning_17,
        :runs_inning_18,
        :runs_inning_19,
        :runs_inning_20,
        :runs_inning_21,
        :runs_inning_22,
        :runs_inning_23,
        :runs_inning_24,
        :runs_inning_extra,
        :sacrifice_flys,
        :sacrifice_hits,
        :saves,
        :shutouts,
        :stolen_bases,
        :strikeouts,
        :team_left_on_base,
        :total_bases,
        :triple_plays,
        :triples,
        :two_out_left_on_base,
        :walks,
        :whip,
        :wild_pitches,
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
