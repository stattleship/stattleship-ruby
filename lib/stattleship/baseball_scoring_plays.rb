module Stattleship
  class BaseballScoringPlays < Stattleship::ScoringPlays
    BASEBALL_SCORING_PLAYS = 'baseball/mlb/scoring_plays'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_SCORING_PLAYS,
            params: params)
    end
  end

  module BaseballScoringPlaysRepresenter
    include Roar::JSON
    include ScoringPlaysRepresenter
  end
end
