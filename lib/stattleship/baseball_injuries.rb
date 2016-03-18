module Stattleship
  class BaseballInjuries < Stattleship::Injuries
    BASEBALL_INJURIES = 'baseball/mlb/injuries'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_INJURIES,
            params: params)
    end
  end

  module BaseballInjuriesRepresenter
    include Roar::JSON
    include InjuriesRepresenter
  end
end
