module Stattleship
  class BasketballStatLeaders < Stattleship::StatLeaders
    BASKETBALL_STAT_LEADERS = 'basketball/nba/stat_leaders'.freeze

    def self.fetch(stat: 'field_goals_made',
                   type: 'basketball_offensive_stat',
                   place: 3)

      super(path: BASKETBALL_STAT_LEADERS,
            stat: stat,
            type: type,
            place: place)
    end
  end
end
