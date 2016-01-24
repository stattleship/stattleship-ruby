module Stattleship
  class HockeyPenalty < Stattleship::Models::Penalty
    def stats
      [
        "#{goals.to_i} G",
        "#{assists.to_i} A",
        "#{points.to_i} P",
        "#{shots.to_i} S",
        "#{hits.to_i} H",
        "#{goals_power_play.to_i} PPG"
      ]
    end

    def to_sentence
      "#{player_name} #{stats.join(', ')} (#{game.name})"
    end
  end

  class HockeyPenalties < Stattleship::Penalties
    HOCKEY_PENALTIES = 'hockey/nhl/penalties'.freeze

    def self.fetch(params:)
      super(path: HOCKEY_PENALTIES,
            params: params)
    end
  end

  module HockeyPenaltiesRepresenter
    include Roar::JSON
    include PenaltiesRepresenter
  end
end
