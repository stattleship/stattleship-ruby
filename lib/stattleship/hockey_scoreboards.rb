module Stattleship
  class HockeyScoreboards < Stattleship::Scoreboards
    HOCKEY_SCOREBOARDS = 'hockey/nhl/scoreboards'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_SCOREBOARDS,
            params: params)
    end
  end

  module HockeyScoreboardsRepresenter
    include Roar::JSON
    include ScoreboardsRepresenter
  end
end
