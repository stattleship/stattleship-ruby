module Stattleship
  class BasketballGameLog < Stattleship::GameLog
  end

  class BasketballGameLogs < Stattleship::GameLogs
    def self.fetch

      client = Stattleship::Client.new(path: 'basketball/nba/game_logs')
      json = client.fetch.body

      nba_game_logs = Stattleship::BasketballGameLogs.new
      nba_game_logs.extend(Stattleship::BasketballGameLogsRepresenter)
      nba_game_logs.from_json(json)

      nba_game_logs.stats
    end
  end

  module BasketballGameLogsRepresenter
    include Roar::JSON

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
