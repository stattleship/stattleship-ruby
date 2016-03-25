module Stattleship
  class Rankings < Stattleship::Endpoint

    RANKINGS_PATH = 'rankings'.freeze

    def self.fetch(params:)
      super(path: RANKINGS_PATH,
            params: params)
    end

    def populate
      rankings.each do |ranking|
        populate_games(ranking)

        games.each do |game|
          populate_game(game)
        end

        populate_players(ranking)
        populate_player_teams(ranking)
      end
    end
  end

  module RankingsRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :rankings, extend: RankingRepresenter,
                       class: Ranking

    collection :games, extend: GameRepresenter,
                       class: Game

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :players, extend: PlayerRepresenter,
                         class: Player

    collection :teams, extend: TeamRepresenter,
                            class: Team

    collection :seasons, extend: SeasonRepresenter,
                         class: Season

    collection :venues, extend: VenueRepresenter,
                        class: Venue
  end
end
