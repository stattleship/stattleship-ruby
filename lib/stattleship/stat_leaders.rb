module Stattleship
  class StatLeader < OpenStruct
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

    collection :stat_leaders, class: Stattleship::StatLeader do
      property :place
      property :player_id
      property :stat
      property :stat_name
    end

    collection :players, extend: Stattleship::PlayerRepresenter, class: Stattleship::Player
    collection :teams, extend: Stattleship::TeamRepresenter, class: Stattleship::Team
  end
end
