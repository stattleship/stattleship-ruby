module Stattleship
  class FootballGameLog < Stattleship::GameLog
    def stats
      [
        { passer_rating: passer_rating },
        { tackles_solo: tackles_solo },
        { tackles_assists: tackles_assists },
        { sacks_total: sacks_total },
        { sacks_yards: sacks_yards },
        { passes_defensed: passes_defensed },
        { interceptions_total: interceptions_total },
        { interceptions_touchdown: interceptions_touchdown },
        { fumbles_committed: fumbles_committed },
        { passes_completions: passes_completions },
        { passes_yards_gross: passes_yards_gross },
        { passes_touchdowns: passes_touchdowns },
        { passes_interceptions: passes_interceptions },
        { receptions_total: receptions_total },
        { receptions_yards: receptions_yards },
        { receptions_touchdowns: receptions_touchdowns },
        { receptions_looks: receptions_looks },
        { rushes_attempts: rushes_attempts },
        { rushes_yards: rushes_yards },
        { rushes_touchdowns: rushes_touchdowns },
        { field_goals_made: field_goals_made },
        { extra_points_made: extra_points_made },
        { punts_total: punts_total },
        { points: points },
      ].map { |stat| build_statline(stat: stat) }.compact
    end

    def to_sentence
      "#{player_name} #{stats.join(', ')} (#{game.name})"
    end

    def build_statline(stat:)
      name = stat.keys.first
      value = stat.values.first
      if value && value != 0
        "#{StatFormatter.format(value: value)} #{stat_abbreviation(stat_name: name)}"
      end
    end

    def stat_abbreviation(stat_name:)
      case stat_name.to_s
      when 'passer_rating'
        'RTG'
      when 'tackles_solo'
        'T'
      when 'tackles_assists'
        'TA'
      when 'sacks_total'
        'SCKS'
      when 'sacks_yards'
        'SYDS'
      when 'passes_defensed'
        'PD'
      when 'interceptions_total'
        'INT'
      when 'interceptions_touchdown'
        'INT TD'
      when 'fumbles_committed'
        'F'
      when 'passes_completions'
        'CMP'
      when 'passes_yards_gross'
        'YDS'
      when 'passes_touchdowns'
        'TD'
      when 'passes_interceptions'
        'INT'
      when 'receptions_total'
        'R'
      when 'receptions_yards'
        'RYDS'
      when 'receptions_touchdowns'
        'RTD'
      when 'receptions_looks'
        'L'
      when 'rushes_attempts'
        'R'
      when 'rushes_yards'
        'RYDS'
      when 'rushes_touchdowns'
        'RTD'
      when 'field_goals_made'
        'FG'
      when 'extra_points_made'
        'XP'
      when 'punts_total'
        'punts_total'
      when 'points'
        'PTS'
      else
        ''
      end
    end
  end

  class FootballGameLogs < Stattleship::GameLogs
    FOOTBALL_GAME_LOGS = 'football/nfl/game_logs'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_GAME_LOGS,
            params: params)
    end
  end

  module FootballGameLogsRepresenter
    include Roar::JSON
    include Roar::Coercion
    include Stattleship::GameLogsRepresenter
    include Virtus.model

    collection :game_logs, class: Stattleship::FootballGameLog do

      [
        :away_team_outcome,
        :home_team_outcome,
        :team_outcome,
        :opponent_outcome,
      ].each do |attribute|
        property attribute
      end

      [
        :passes_percentage,
        :receptions_average_yards_per,
        :passer_rating,
        :rushing_average_yards_per,
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
        :tackles_solo,
        :tackles_assists,
        :sacks_total,
        :sacks_yards,
        :passes_defensed,
        :interceptions_total,
        :interceptions_yards,
        :interceptions_longest,
        :interceptions_touchdown,
        :defense_misc_assisted_tackles,
        :defense_misc_solo_tackles,
        :defense_tackles,
        :defense_tackles_for_loss,
        :defense_tackles_for_loss_yards,
        :interceptions_returned_touchdowns_longest_yards,
        :safeties,
        :fumbles_forced,
        :fumbles_committed,
        :fumbles_lost,
        :fumbles_own_recovered,
        :fumbles_opposing_recovered,
        :fumbles_own_touchdowns,
        :fumbles_opposing_touchdowns,
        :fumbles_recovered_touchdowns_longest_yards,
        :defense_fumble_recoveries,
        :defense_miscellaneous_fumble_recoveries,
        :passes_completions,
        :passes_yards_gross,
        :passes_touchdowns,
        :passes_interceptions,
        :passes_longest,
        :receptions_total,
        :receptions_yards,
        :receptions_touchdowns,
        :receptions_looks,
        :receptions_longest,
        :passing_2pt_conversions_succeeded,
        :passing_touchdowns_longest_yards,
        :receiving_2pt_conversions_succeeded,
        :receiving_touchdowns_longest_yards,
        :rushes_attempts,
        :rushes_yards,
        :rushes_touchdowns,
        :rushes_longest,
        :rushing_2pt_conversions_succeeded,
        :rushing_gross_yards,
        :rushing_lost_yards,
        :rushing_touchdowns_longest_yards,
        :sacks_against_total,
        :sacks_against_yards,
        :extra_points_attempts,
        :extra_points_made,
        :field_goal_attempts,
        :field_goals_made,
        :field_goals_missed,
        :field_goals_blocked,
        :field_goals_attempted_against,
        :field_goals_succeeded_against,
        :field_goals_succeeded_longest_yards,
        :field_goals_succeeded_yards,
        :total_touchdowns,
        :penalty_yards,
        :points,
        :punts_total,
        :punts_yards_gross,
        :punts_inside_twenty,
        :punts_longest,
        :touchbacks_total,
        :punts_blocked,
        :defense_special_teams_assisted_tackles,
        :defense_special_teams_fumble_recoveries,
        :defense_special_teams_solo_tackles,
        :defense_special_teams_tackles,
        :defense_special_teams_kicks_blocked,
        :kicking_singles,
        :kickoff_longest_yards,
        :kickoff_return_faircatches,
        :kickoff_return_longest_yards,
        :kickoff_return_touchdowns,
        :kickoff_return_touchdowns_longest_yards,
        :kickoff_return_yards,
        :kickoff_returns,
        :kickoff_singles,
        :kickoff_yards,
        :kickoffs,
        :punt_return_faircatches,
        :punt_return_longest_yards,
        :punt_return_touchdowns,
        :punt_return_touchdowns_longest_yards,
        :punt_return_yards,
        :punt_returns,
        :punting_net_yards,
        :punting_singles,
      ].each do |attribute|
        property attribute
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
