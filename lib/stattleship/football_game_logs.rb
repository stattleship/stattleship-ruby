module Stattleship
  class FootballGameLog < Stattleship::GameLog
  end

  class FootballGameLogs < Stattleship::GameLogs
    FOOTBALL_GAME_LOGS = 'football/nfl/game_logs'.freeze

    def self.fetch(team_id:)
      query = { 'query' => {
                  'team_id' => team_id,
                }
              }

      client = Stattleship::Client.new(path: FOOTBALL_GAME_LOGS,
                                       query: query)
      json = client.fetch.body

      logs = Stattleship::FootballGameLogs.new
      logs.extend(Stattleship::FootballGameLogsRepresenter)
      logs.from_json(json)

      logs.data
    end
  end

  module FootballGameLogsRepresenter
    include Roar::JSON

    collection :game_logs, class: Stattleship::FootballGameLog do
      [
       :game_played,
       :game_started,
       :home_team_outcome,
       :home_team_score,
       :away_team_outcome,
       :away_team_score,
       :team_outcome,
       :team_score,
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
       :passes_percentage,
       :passes_yards_gross,
       :passes_touchdowns,
       :passes_interceptions,
       :passes_longest,
       :receptions_total,
       :receptions_yards,
       :receptions_touchdowns,
       :receptions_average_yards_per,
       :receptions_looks,
       :receptions_longest,
       :passing_2pt_conversions_succeeded,
       :passing_touchdowns_longest_yards,
       :receiving_2pt_conversions_succeeded,
       :receiving_touchdowns_longest_yards,
       :passer_rating,
       :rushes_attempts,
       :rushes_yards,
       :rushes_touchdowns,
       :rushing_average_yards_per,
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
       :punting_singles
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

    collection :games, extend: Stattleship::GameRepresenter,
                         class: Stattleship::Game
    collection :leagues, extend: Stattleship::LeagueRepresenter,
                         class: Stattleship::League
    collection :players, extend: Stattleship::PlayerRepresenter,
                         class: Stattleship::Player
    collection :seasons, extend: Stattleship::SeasonRepresenter,
                       class: Stattleship::Season
    collection :teams, extend: Stattleship::TeamRepresenter,
                       class: Stattleship::Team
    collection :venues, extend: Stattleship::VenueRepresenter,
                         class: Stattleship::Venue
  end
end
