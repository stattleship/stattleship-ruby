module Stattleship
  class BaseballScoreboards < Stattleship::Scoreboards
    BASEBALL_SCOREBOARDS = 'baseball/mlb/scoreboards'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_SCOREBOARDS,
            params: params)
    end
  end

  module BaseballScoreboardsRepresenter
    include Roar::JSON
    include ScoreboardsRepresenter
  end
end
