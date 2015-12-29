module Stattleship
  class Leader < OpenStruct
    def to_sentence
      "#{team.nickname} #{player.position_name} #{player.name} is in #{place.ordinalize} place with #{stat} #{stat_name}"
    end
  end

  class StatLeaders < OpenStruct
    def leaders
      stat_leaders.each do |leader|
        leader.player = players.detect { |player| player.id == leader.player_id }
        leader.team = teams.detect { |team| team.id == leader.player.team_id }
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

    collection :players, extend: Stattleship::PlayerRepresenter, class: Stattleship::Player
    collection :teams, extend: Stattleship::TeamRepresenter, class: Stattleship::Team
  end
end
