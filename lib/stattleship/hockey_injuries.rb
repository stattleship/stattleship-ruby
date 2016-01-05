module Stattleship
  class HockeyInjuries < Stattleship::Injuries
    HOCKEY_INJURIES = 'hockey/nhl/injuries'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_INJURIES,
            params: params)
    end
  end

  module HockeyInjuriesRepresenter
    include Roar::JSON
    include InjuriesRepresenter
  end
end
