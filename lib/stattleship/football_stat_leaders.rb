module Stattleship
  class FootballStatLeaders < Stattleship::StatLeaders
    FOOTBALL_STAT_LEADERS = 'football/nfl/stat_leaders'.freeze

    def self.fetch(stat: 'passes_touchdowns',
                   type: 'football_passing_stat',
                   place: 3)

      super(path: FOOTBALL_STAT_LEADERS,
            stat: stat,
            type: type,
            place: place)
    end
  end

  module FootballStatLeadersRepresenter
    include Roar::JSON
    include StatLeadersRepresenter
  end
end
