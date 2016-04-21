module Stattleship
  class BaseballGameLog < Stattleship::GameLog
    def stats
      if player.pitcher?
        [
          "#{pitcher_strikeouts.to_i} K",
          "#{pitches_thrown.to_i} thrown",
          "#{strikes_thrown.to_i} K thrown",
          "#{pitcher_runs.to_i} R"
        ]
      else
        [
          "#{hits.to_i} H",
          "#{runs.to_i} R",
          "#{runs_batted_in.to_i} RBI",
          "#{fielding_errors.to_i} E"
        ]
      end
    end

    def to_sentence
      "#{player_name} #{stats.join(', ')} (#{game.name})"
    end
  end

  class BaseballGameLogs < Stattleship::GameLogs
    BASEBALL_GAME_LOGS = 'baseball/mlb/game_logs'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_GAME_LOGS,
            params: params)
    end
  end

  module BaseballGameLogsRepresenter
    include Roar::JSON
    include Roar::Coercion
    include Stattleship::GameLogsRepresenter
    include Virtus.model

    collection :game_logs, class: Stattleship::BaseballGameLog do

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
        :inherited_runner_scoring_percentage,
        :innings_pitched,
        :on_base_percentage,
        :on_base_plus_slugging,
        :slugging_percentage,
        :strike_percentage,
        :whip,
      ].each do |attribute|
        property attribute, type: BigDecimal
      end

      [
        :at_bats,
        :away_team_score,
        :balks,
        :balls_thrown,
        :batters_faced,
        :blown_saves,
        :catcher_interferences,
        :catcher_stealers_allowed,
        :catcher_stealers_caught,
        :caught_stealing,
        :complete_games,
        :doubles,
        :extra_base_hits,
        :fielding_errors,
        :fly_ball_outs,
        :game_played,
        :game_started,
        :ground_ball_outs,
        :grounded_into_double_plays,
        :hit_by_pitch,
        :hits,
        :holds,
        :home_runs,
        :home_team_score,
        :inherited_runners,
        :inherited_runners_scored,
        :intentional_walks,
        :intentional_walks_against,
        :left_on_base,
        :losses,
        :no_decisions,
        :opponent_score,
        :outfield_assists,
        :outs_pitched,
        :passed_balls,
        :pickoffs,
        :pitcher_caught_stealing,
        :pitcher_earned_runs,
        :pitcher_fielding_errors,
        :pitcher_games_played,
        :pitcher_games_started,
        :pitcher_hit_by_pitch,
        :pitcher_hits,
        :pitcher_home_runs,
        :pitcher_intentional_walks,
        :pitcher_runs,
        :pitcher_sacrifice_flys,
        :pitcher_sacrifice_hits,
        :pitcher_stolen_bases,
        :pitcher_strikeouts,
        :pitcher_walks,
        :pitches_thrown,
        :quality_starts,
        :rlisp_two_out,
        :runs,
        :runs_batted_in,
        :sacrifice_flys,
        :sacrifice_hits,
        :saves,
        :shutouts,
        :singles,
        :starting_pitches_thrown,
        :stolen_bases,
        :strikeouts,
        :strikes_thrown,
        :team_score,
        :total_bases,
        :triples,
        :two_out_rbi,
        :walks,
        :wild_pitches,
        :wins,
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
        :player_id,
        :game_id,
        :team_id
      ].each do |relationship|
        property relationship
      end
    end
  end
end
