module Stattleship
  class Pitches < Stattleship::Endpoint
    PITCHES = 'baseball/mlb/pitches'.freeze

    def self.fetch(params:)
      super(path: PITCHES,
            params: params)
    end

    def populate
      pitches.each do |p|
        populate_game(model)
      end

      # games.each do |game|
      #   populate_game(game)
      # end
    end
  end

  module PitchesRepresenter
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

    collection :pitches, extend: PitchRepresenter,
                         class: Pitch
  end
end
