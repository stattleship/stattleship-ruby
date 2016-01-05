module Stattleship
  class BasketballInjuries < Stattleship::Injuries
    BASKETBALL_INJURIES = 'basketball/nba/injuries'.freeze

    def self.fetch(params:)
      super(path: BASKETBALL_INJURIES,
            params: params)
    end
  end

  module BasketballInjuriesRepresenter
    include Roar::JSON
    include InjuriesRepresenter
  end
end
