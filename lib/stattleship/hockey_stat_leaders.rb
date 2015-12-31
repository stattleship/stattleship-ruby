module Stattleship
  class HockeyStatLeaders < Stattleship::StatLeaders
    HOCKEY_STAT_LEADERS = 'hockey/nhl/stat_leaders'.freeze

    def self.fetch(stat: 'hits',
                   type: 'hockey_defensive_stat',
                   place: 3)

      super(path: HOCKEY_STAT_LEADERS,
            stat: stat,
            type: type,
            place: place)
    end
  end

  module HockeyStatLeadersRepresenter
    include Roar::JSON
    include StatLeadersRepresenter
  end
end
