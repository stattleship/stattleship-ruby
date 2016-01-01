module Stattleship
  class HockeyStatLeaders < Stattleship::StatLeaders
    HOCKEY_STAT_LEADERS = 'hockey/nhl/stat_leaders'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_STAT_LEADERS,
            params: params)
    end
  end

  module HockeyStatLeadersRepresenter
    include Roar::JSON
    include StatLeadersRepresenter
  end
end
