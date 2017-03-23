module Stattleship
  class LineUps < Stattleship::Endpoint
    LINE_UPS = 'baseball/mlb/lineups'.freeze

    def self.fetch(params:)
      super(path: LINE_UPS,
            params: params)
    end

    def populate
      lineups.each do |model|
        populate_games(model)

        games.each do |game|
          populate_game(game)
        end

        populate_players(model)
        populate_teams(model)
      end
    end
  end

  module LineUpsRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :away_teams, extend: TeamRepresenter,
                            class: Team

    collection :home_teams, extend: TeamRepresenter,
                            class: Team

    collection :winning_teams, extend: TeamRepresenter,
                               class: Team

    collection :games, extend: GameRepresenter,
                       class: Game

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :officials, extend: OfficialRepresenter,
                           class: Official

    collection :seasons, extend: SeasonRepresenter,
                         class: Season

    collection :venues, extend: VenueRepresenter,
                        class: Venue

    collection :teams, extend: TeamRepresenter,
                       class: Team

    collection :players, extend: PlayerRepresenter,
                         class: Player

    collection :lineups, extend: LineUpRepresenter,
                          class: LineUp
  end
end
