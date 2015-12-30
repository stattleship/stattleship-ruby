module Stattleship
  class BasketballGameLog < Stattleship::GameLog
  end

  class BasketballGameLogs < Stattleship::GameLogs
    BASKETBALL_GAME_LOGS = 'basketball/nba/game_logs'.freeze

    def self.fetch(team_id:)
      query = { 'query' => {
                  'team_id' => team_id,
                }
              }

      client = Stattleship::Client.new(path: BASKETBALL_GAME_LOGS,
                                       query: query)
      json = client.fetch.body

      logs = Stattleship::BasketballGameLogs.new
      logs.extend(Stattleship::BasketballGameLogsRepresenter)
      logs.from_json(json)

      logs.data
    end
  end

  module BasketballGameLogsRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :game_logs, class: Stattleship::BasketballGameLog do
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
        :field_goals_attempted,
        :field_goals_made,
        :field_goals_pct,
        :free_throws_attempted,
        :free_throws_made,
        :free_throws_pct,
        :points,
        :three_pointers_attempted,
        :three_pointers_made,
        :three_pointers_pct,
        :turnovers,
        :steals,
        :blocks,
        :personal_fouls,
        :technical_fouls,
        :time_played_total,
        :plus_minus,
        :disqualifications,
        :rebounds_defensive,
        :rebounds_offensive,
        :rebounds_total,
        :double_double,
        :double_triple_double,
        :double_twenty,
        :five_by_five,
        :five_by_seven,
        :five_by_six,
        :five_by_steals_blocks,
        :quadruple_double,
        :quintuple_double,
        :thirty_thirty,
        :triple_double,
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
