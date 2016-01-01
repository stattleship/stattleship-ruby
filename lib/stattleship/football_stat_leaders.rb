module Stattleship
  class FootballStatLeaders < Stattleship::StatLeaders
    FOOTBALL_STAT_LEADERS = 'football/nfl/stat_leaders'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_STAT_LEADERS,
            params: params)
    end
  end

  module FootballStatLeadersRepresenter
    include Roar::JSON
    include StatLeadersRepresenter
  end
end
