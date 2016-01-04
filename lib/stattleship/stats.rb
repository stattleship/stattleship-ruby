module Stattleship
  class Stat < OpenStruct
    def name
      subject.name
    end

    def subject
      player || team
    end

    def to_sentence
      "#{name} had #{stat || 'no'} #{stat_name} on #{game.name}"
    end
  end

  class Stats < Stattleship::Endpoint
    def populate
      stats.each do |stat|
        populate_games(stat)
      end
    end
  end

  module StatsRepresenter
    include Roar::JSON

    collection :stats, class: Stattleship::Stat do
      property :game_id
      property :stat
      property :stat_name

      property :player,
               extend: Stattleship::Models::PlayerRepresenter,
               class: Stattleship::Models::Player

      property :team,
               extend: Stattleship::Models::TeamRepresenter,
               class: Stattleship::Models::Team
    end

    collection :games, extend: Stattleship::Models::GameRepresenter,
                       class: Stattleship::Models::Game

    collection :leagues, extend: Stattleship::Models::LeagueRepresenter,
                         class: Stattleship::Models::League

    collection :seasons, extend: Stattleship::Models::SeasonRepresenter,
                         class: Stattleship::Models::Season

    collection :venues, extend: Stattleship::Models::VenueRepresenter,
                        class: Stattleship::Models::Venue

    collection :players, extend: Stattleship::Models::PlayerRepresenter,
                         class: Stattleship::Models::Player

    collection :playing_positions, extend: Stattleship::Models::PlayingPositionRepresenter,
                                   class: Stattleship::Models::PlayingPosition

    collection :teams, extend: Stattleship::Models::TeamRepresenter,
                       class: Stattleship::Models::Team
  end
end
