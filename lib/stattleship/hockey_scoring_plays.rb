module Stattleship
  class HockeyScoringPlays < Stattleship::ScoringPlays
    HOCKEY_SCORING_PLAYS = 'hockey/nhl/scoring_plays'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_SCORING_PLAYS,
            params: params)
    end
  end

  module HockeyScoringPlaysRepresenter
    include Roar::JSON
    include ScoringPlaysRepresenter
  end
end
