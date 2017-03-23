module Stattleship
  class AtBats < Stattleship::Endpoint
    AT_BATS = 'baseball/mlb/at_bats'.freeze

    def self.fetch(params:)
      super(path: AT_BATS,
            params: params)
    end

    def populate
      at_bats.each do |model|
        populate_games(model)

        games.each do |game|
          populate_game(game)
        end

        populate_pitchers(pitch)
        populate_hitters(model)
        populate_hitter_teams(model)


        (baseball_pitches || []).each do |pitch|
          populate_pitchers(pitch)
          populate_hitters(pitch)
          populate_teams(pitch)
          populate_hitter_teams(pitch)
        end

        populate_baseball_pitches(model)

      end
    end
  end

  module AtBatsRepresenter
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

    collection :baseball_pitches, extend: PitchRepresenter,
                                  class: Pitch

    collection :at_bats, extend: AtBatRepresenter,
                         class: AtBat
  end
end
