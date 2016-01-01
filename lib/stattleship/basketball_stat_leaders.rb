module Stattleship
  class BasketballStatLeaders < Stattleship::StatLeaders
    BASKETBALL_STAT_LEADERS = 'basketball/nba/stat_leaders'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_STAT_LEADERS,
            params: params)
    end
  end

  module BasketballStatLeadersRepresenter
    include Roar::JSON
    include StatLeadersRepresenter
  end
end
