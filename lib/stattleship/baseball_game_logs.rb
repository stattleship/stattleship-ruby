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
        :slugging_percentage,
        :batting_average,
        :whip,
        :on_base_percentage,
        :on_base_plus_slugging,
        :earned_run_average,
      ].each do |attribute|
        property attribute, type: BigDecimal
      end

      [
        :game_played,
        :game_started,
        :home_team_score,
        :away_team_score,
        :team_score,
        :opponent_score,
        :catcher_interferences,
        :catcher_stealers_allowed,
        :catcher_stealers_caught,
        :fielding_errors,
        :outfield_assists,
        :passed_balls,
        :at_bats,
        :caught_stealing,
        :doubles,
        :grounded_into_double_plays,
        :hit_by_pitch,
        :hits,
        :home_runs,
        :intentional_walks,
        :intentional_walks_against,
        :left_on_base,
        :rlisp_two_out,
        :runs,
        :runs_batted_in,
        :sacrifice_flys,
        :sacrifice_hits,
        :stolen_bases,
        :strikeouts,
        :total_bases,
        :triples,
        :two_out_rbi,
        :walks,
        :balks,
        :batters_faced,
        :blown_saves,
        :complete_games,
        :pitcher_fielding_errors,
        :fly_ball_outs,
        :ground_ball_outs,
        :holds,
        :inherited_runners,
        :inherited_runners_scored,
        :losses,
        :no_decisions,
        :outs_pitched,
        :pickoffs,
        :pitcher_caught_stealing,
        :pitcher_earned_runs,
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
        :saves,
        :shutouts,
        :starting_pitches_thrown,
        :strikes_thrown,
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
