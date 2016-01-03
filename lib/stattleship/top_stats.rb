module Stattleship
  class TopStat < OpenStruct
    def to_sentence
      "#{player.name} had #{stat} #{stat_name} in #{game.name} for the #{place.ordinalize} best performance"
    end
  end

  class TopStats < Stattleship::Endpoint
    def populate
      top_stats.each do |top_stat|
        populate_games(top_stat)
        populate_players(top_stat)
        populate_player_teams(top_stat)
      end
    end
  end

  module TopStatsRepresenter
    include Roar::JSON

    collection :top_stats, class: Stattleship::TopStat do
      property :game_id
      property :place
      property :player_id
      property :stat
      property :stat_name
    end

    collection :games, extend: Stattleship::Models::GameRepresenter,
                       class: Stattleship::Models::Game

    collection :players, extend: Stattleship::Models::PlayerRepresenter,
                         class: Stattleship::Models::Player

    collection :teams, extend: Stattleship::Models::TeamRepresenter,
                       class: Stattleship::Models::Team
  end
end
