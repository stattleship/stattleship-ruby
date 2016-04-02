module Stattleship
  class BasketballTeamGameLog < Stattleship::TeamGameLog
    def stats
      [
        "#{field_goals_made.to_i} FGM",
        "#{(field_goals_percentage.to_f * 100).round(1)} FG%",
        "#{points_scored_total.to_i} PTS",
        "#{rebounds_defensive.to_i} DRB",
        "#{rebounds_offensive.to_i} ORB",
        "#{rebounds_total} REB"
      ]
    end

    def to_sentence
      "#{team_name} #{stats.join(', ')} (#{game.name})"
    end
  end

  class BasketballTeamGameLogs < Stattleship::TeamGameLogs
    BASKETBALL_TEAM_GAME_LOGS = 'basketball/nba/team_game_logs'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_TEAM_GAME_LOGS,
            params: params)
    end
  end

  module BasketballTeamGameLogsRepresenter
    include Roar::JSON
    include Roar::Coercion
    include Stattleship::TeamGameLogsRepresenter
    include Virtus.model

    collection :team_game_logs, class: Stattleship::BasketballTeamGameLog do

      [
        :away_team_outcome,
        :home_team_outcome,
        :team_outcome,
        :opponent_outcome,
      ].each do |attribute|
        property attribute
      end

      [
        :field_goals_percentage,
        :free_throws_percentage,
        :three_pointers_percentage,
      ].each do |attribute|
        property attribute, type: BigDecimal
      end

      [
        :away_team_score,
        :home_team_score,
        :team_score,
        :opponent_score,
        :assists_total,
        :blocks_total,
        :coach_technical_fouls,
        :field_goals_attempted,
        :field_goals_made,
        :free_throws_attempted,
        :free_throws_made,
        :personal_fouls,
        :points_biggest_lead,
        :points_fast_break,
        :points_highest,
        :points_in_paint,
        :points_overtime,
        :points_overtime_1,
        :points_overtime_2,
        :points_overtime_3,
        :points_overtime_4,
        :points_overtime_5,
        :points_quarter_1,
        :points_quarter_2,
        :points_quarter_3,
        :points_quarter_4,
        :points_scored_off_turnovers,
        :points_scored_total,
        :points_unanswered,
        :rebounds_defensive,
        :rebounds_offensive,
        :rebounds_total,
        :steals_total,
        :team_rebounds_total,
        :team_turnovers_total,
        :technical_fouls,
        :three_pointers_attempted,
        :three_pointers_made,
        :turnovers_total,
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
