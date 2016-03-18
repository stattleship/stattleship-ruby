module Stattleship
  class BaseballPenalties < Stattleship::Penalties
    BASEBALL_PENALTIES = 'baseball/mlb/penalties'.freeze

    def self.fetch(params:)
      super(path: BASEBALL_PENALTIES,
            params: params)
    end
  end

  module BaseballPenaltiesRepresenter
    include Roar::JSON
    include PenaltiesRepresenter
  end
end
