module Stattleship
  class Pitches < Stattleship::Endpoint
    PITCHES = 'baseball/mlb/pitches'.freeze

    def self.fetch(params:)
      super(path: PITCHES,
            params: params)
    end

    def populate
      pitches.each do |model|
        populate_games(model)

        games.each do |game|
          populate_game(game)
        end

        populate_pitchers(model)
        populate_hitters(model)
        populate_teams(model)
        populate_hitter_teams(model)
      end
    end
  end

  module PitchesRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :away_teams, extend: TeamRepresenter,
                            class: Team

    collection :hitters, extend: PlayerRepresenter,
                         class: Player

    collection :hitter_teams, extend: TeamRepresenter,
                              class: Team

    collection :home_teams, extend: TeamRepresenter,
                            class: Team

    collection :pitchers, extend: PlayerRepresenter,
                          class: Player

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

    collection :pitches, extend: PitchRepresenter,
                         class: Pitch
  end
end
