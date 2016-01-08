module Stattleship
  class TotalTeamStat < Stattleship::Endpoint
    def to_sentence
      "The #{team.full_name} have #{StatFormatter.stat(stat_name: stat, value: total)} #{stat}"
    end

    def self.fetch(path:, params:)
      super.first
    end

    def populate
      populate_teams(total_team_stat)
      total_team_stat
    end
  end

  module TotalTeamStatRepresenter
    include Roar::JSON
    include Roar::Coercion

    property :total_team_stat, class: Stattleship::TotalTeamStat do
      property :team_id
      property :stat
      property :total, type: BigDecimal
    end

    collection :teams, extend: Stattleship::Models::TeamRepresenter,
                       class: Stattleship::Models::Team
  end
end
