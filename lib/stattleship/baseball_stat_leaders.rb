module Stattleship
  class BaseballStatLeaders < Stattleship::StatLeaders
    BASEBALL_STAT_LEADERS = 'baseball/mlb/stat_leaders'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_STAT_LEADERS,
            params: params)
    end
  end

  module BaseballStatLeadersRepresenter
    include Roar::JSON
    include StatLeadersRepresenter
  end
end
