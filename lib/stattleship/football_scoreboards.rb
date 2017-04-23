module Stattleship
  class FootballScoreboards < Stattleship::Scoreboards
    FOOTBALL_SCOREBOARDS = 'football/nfl/scoreboards'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_SCOREBOARDS,
            params: params)
    end
  end

  module FootballScoreboardsRepresenter
    include Roar::JSON
    include ScoreboardsRepresenter
  end
end
