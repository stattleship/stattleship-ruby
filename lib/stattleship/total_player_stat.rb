module Stattleship
  class TotalPlayerStat < Stattleship::Endpoint
    def to_sentence
      if season_name.nil?
        "#{player.name} has #{format_stat(total)} #{humanized_stat.downcase}"
      else
        "#{player.name} had #{format_stat(total)} #{humanized_stat.downcase} in the #{season_name} season"
      end
    end

    def format_stat(value)
      StatFormatter.stat(stat_name: stat, value: total)
    end

    def self.fetch(path:, params:)
      super.first
    end

    def populate
      populate_players(total_player_stat)
      populate_player_teams(total_player_stat)
      populate_season(total_player_stat)
      total_player_stat
    end
  end

  module TotalPlayerStatRepresenter
    include Roar::JSON
    include Roar::Coercion

    property :total_player_stat, class: Stattleship::TotalPlayerStat do
      property :player_id
      property :season_id
      property :interval_type
      property :humanized_stat
      property :season_name
      property :since
      property :stat
      property :total, type: BigDecimal
      property :week
    end

    collection :players, extend: Stattleship::Models::PlayerRepresenter,
                         class: Stattleship::Models::Player
    collection :seasons, extend: Stattleship::Models::SeasonRepresenter,
                         class: Stattleship::Models::Season
    collection :teams, extend: Stattleship::Models::TeamRepresenter,
                       class: Stattleship::Models::Team
  end
end
