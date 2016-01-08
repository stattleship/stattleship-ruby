module Stattleship
  class Stat < OpenStruct
    def name
      subject.name
    end

    def subject
      player || team
    end

    def to_sentence
      "#{name} had #{StatFormatter.stat(stat_name: stat_name, value: stat) || 'no'} #{stat_name} on #{game.name}"
    end
  end

  class Stats < Stattleship::Endpoint
    def populate
      stats.each do |stat|
        populate_games(stat)

        games.each do |game|
          populate_game(game)
        end
      end
    end
  end

  module StatsRepresenter
    include Roar::JSON
    include Stattleship::Models

    collection :stats, class: Stattleship::Stat do
      property :game_id
      property :stat
      property :stat_name

      property :player,
               extend: PlayerRepresenter,
               class: Player

      property :team,
               extend: TeamRepresenter,
               class: Team
    end

    collection :away_teams, extend: TeamRepresenter,
                            class: Team

    collection :home_teams, extend: TeamRepresenter,
                            class: Team

    collection :winning_teams, extend: TeamRepresenter,
                               class: Team

    collection :games, extend: GameRepresenter,
                       class: Game

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :seasons, extend: SeasonRepresenter,
                         class: Season

    collection :venues, extend: VenueRepresenter,
                        class: Venue

    collection :players, extend: PlayerRepresenter,
                         class: Player

    collection :playing_positions, extend: PlayingPositionRepresenter,
                                   class: PlayingPosition

    collection :teams, extend: TeamRepresenter,
                       class: Team
  end
end
