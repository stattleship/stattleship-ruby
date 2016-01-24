module Stattleship
  class BasketballScoringPlays < Stattleship::ScoringPlays
    BASKETBALL_SCORING_PLAYS = 'basketball/nba/scoring_plays'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_SCORING_PLAYS,
            params: params)
    end
  end

  module BasketballScoringPlaysRepresenter
    include Roar::JSON
    include ScoringPlaysRepresenter
  end
end
