module Stattleship
  class TotalTeamStat < Stattleship::Endpoint
    def to_sentence
      if season_name.nil?
        "The #{team.full_name} have #{StatFormatter.stat(stat_name: stat, value: total)} #{lowercase_stat}"
      else
        "The #{team.full_name} had #{StatFormatter.stat(stat_name: stat, value: total)} #{lowercase_stat} in the #{season_name} season"
      end
    end

    def lowercase_stat
      if humanized_stat
        humanized_stat.downcase
      end
    end

    def self.fetch(path:, params:)
      super.first
    end

    def populate
      populate_teams(total_team_stat)
      populate_season(total_team_stat)

      total_team_stat
    end
  end

  module TotalTeamStatRepresenter
    include Roar::JSON
    include Roar::Coercion

    property :total_team_stat, class: Stattleship::TotalTeamStat do
      property :season_id
      property :team_id
      property :stat
      property :interval_type
      property :humanized_stat
      property :season_name
      property :since
      property :total, type: BigDecimal
      property :week
    end

    collection :seasons, extend: Stattleship::Models::SeasonRepresenter,
                         class: Stattleship::Models::Season

    collection :teams, extend: Stattleship::Models::TeamRepresenter,
                       class: Stattleship::Models::Team
  end
end
