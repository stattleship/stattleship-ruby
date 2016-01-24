module Stattleship
  class FootballPenalties < Stattleship::Penalties
    FOOTBALL_PENALTIES = 'football/nfl/penalties'.freeze

    def self.fetch(params:)
      super(path: FOOTBALL_PENALTIES,
            params: params)
    end
  end

  module FootballPenaltiesRepresenter
    include Roar::JSON
    include PenaltiesRepresenter
  end
end
