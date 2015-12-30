module Stattleship
  class HockeyStatLeaders < Stattleship::StatLeaders
    HOCKEY_STAT_LEADERS = 'hockey/nhl/stat_leaders'.freeze

    def path
      HOCKEY_STAT_LEADERS
    end
  end
end
