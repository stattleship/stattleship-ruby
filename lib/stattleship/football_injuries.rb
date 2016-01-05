module Stattleship
  class FootballInjuries < Stattleship::Injuries
    FOOTBALL_INJURIES = 'football/nfl/injuries'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_INJURIES,
            params: params)
    end
  end

  module FootballInjuriesRepresenter
    include Roar::JSON
    include InjuriesRepresenter
  end
end
