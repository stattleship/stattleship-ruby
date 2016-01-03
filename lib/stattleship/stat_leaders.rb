module Stattleship
  class Leader < OpenStruct
    def to_sentence
      "#{player.name} is in #{place.ordinalize} place with #{stat} #{stat_name}"
    end
  end

  class StatLeaders < Stattleship::Endpoint
    def populate
      stat_leaders.each do |leader|
        populate_players(leader)
        populate_player_teams(leader)
      end
    end
  end

  module StatLeadersRepresenter
    include Roar::JSON

    collection :stat_leaders, class: Stattleship::Leader do
      property :place
      property :player_id
      property :stat
      property :stat_name
    end

    collection :players, extend: Stattleship::Models::PlayerRepresenter,
                         class: Stattleship::Models::Player
    collection :teams, extend: Stattleship::Models::TeamRepresenter,
                       class: Stattleship::Models::Team
  end
end
