module Stattleship
  class Leader < OpenStruct
    def to_sentence
      "#{player.name} is in #{place.ordinalize} place with #{stat} #{stat_name}"
    end
  end

  class StatLeaders < OpenStruct
    def leaders
      @leaders ||= hydrate
    end

    def hydrate
      stat_leaders.each do |leader|
        hydrate_players(leader)
        hydrate_teams(leader)
      end
    end

    def hydrate_players(model)
      model.player = players.detect do |player|
        player.id == model.player_id
      end
    end

    def hydrate_teams(model)
      model.team = teams.detect do |team|
        team.id == model.player.team_id
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

    collection :players, extend: Stattleship::PlayerRepresenter,
                         class: Stattleship::Player
    collection :teams, extend: Stattleship::TeamRepresenter,
                       class: Stattleship::Team
  end
end
