module Stattleship
  class HockeyGameLog < Stattleship::GameLog
  end

  class HockeyGameLogs < Stattleship::GameLogs
    HOCKEY_GAME_LOGS = 'hockey/nhl/game_logs'.freeze

    def self.fetch(team_id:)
      query = { 'query' => {
                  'team_id' => team_id,
                }
              }

      client = Stattleship::Client.new(path: HOCKEY_GAME_LOGS,
                                       query: query)
      json = client.fetch.body

      logs = Stattleship::HockeyGameLogs.new
      logs.extend(Stattleship::HockeyGameLogsRepresenter)
      logs.from_json(json)

      logs.data
    end
  end

  module HockeyGameLogsRepresenter
    include Roar::JSON
    include Stattleship::Models

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

    collection :games, extend: GameRepresenter,
                         class: Game
    collection :leagues, extend: LeagueRepresenter,
                         class: League
    collection :players, extend: PlayerRepresenter,
                         class: Player
    collection :seasons, extend: SeasonRepresenter,
                       class: Season
    collection :teams, extend: TeamRepresenter,
                       class: Team
    collection :venues, extend: VenueRepresenter,
                         class: Venue
  end
end
