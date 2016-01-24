module Stattleship
  class FootballScoringPlays < Stattleship::ScoringPlays
    FOOTBALL_SCORING_PLAYS = 'football/nfl/scoring_plays'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_SCORING_PLAYS,
            params: params)
    end
  end

  module FootballScoringPlaysRepresenter
    include Roar::JSON
    include ScoringPlaysRepresenter
  end
end
