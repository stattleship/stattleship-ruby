module Stattleship
  class BasketballStatLeaders < Stattleship::StatLeaders
    BASKETBALL_STAT_LEADERS = 'basketball/nba/stat_leaders'.freeze

    def path
      BASKETBALL_STAT_LEADERS
    end
  end
end
