module Stattleship
  class TopStat < OpenStruct
    def to_sentence
      "#{player.name} had #{format_stat(stat)} #{stat_name} in #{game.name} for the #{place.ordinalize} best performance"
    end

    def format_stat(value)
      StatFormatter.stat(stat_name: stat_name, value: stat)
    end
  end

  class TopStats < Stattleship::Endpoint
    def populate
      top_stats.each do |top_stat|
        populate_games(top_stat)

        games.each do |game|
          populate_game(game)
        end

        populate_players(top_stat)
        populate_player_teams(top_stat)
      end
    end
  end

  module TopStatsRepresenter
    include Roar::JSON
    include Roar::Coercion
    include Stattleship::Models

    collection :top_stats, class: Stattleship::TopStat do
      property :game_id
      property :place, type: Integer
      property :player_id
      property :stat, type: BigDecimal
      property :stat_name
    end

    collection :away_teams, extend: TeamRepresenter,
                            class: Team

    collection :home_teams, extend: TeamRepresenter,
                            class: Team

    collection :winning_teams, extend: TeamRepresenter,
                               class: Team

    collection :games, extend: GameRepresenter,
                       class: Game

    collection :players, extend: PlayerRepresenter,
                         class: Player

    collection :teams, extend: TeamRepresenter,
                       class: Team
  end
end
