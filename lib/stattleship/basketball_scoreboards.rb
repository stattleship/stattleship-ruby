module Stattleship
  class BasketballScoreboards < Stattleship::Scoreboards
    BASKETBALL_SCOREBOARDS = 'basketball/nba/scoreboards'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_SCOREBOARDS,
            params: params)
    end
  end

  module BasketballScoreboardsRepresenter
    include Roar::JSON
    include ScoreboardsRepresenter
  end
end
