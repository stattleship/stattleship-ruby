module Stattleship
  class Leader < OpenStruct
    def to_sentence
      "#{player.name} is in #{place.ordinalize} place with #{stat} #{stat_name}"
    end
  end

  class StatLeaders < OpenStruct
    def self.fetch(path:, stat:, type:, place: 3)
      query = { 'query' => {
                  'stat' => stat,
                  'type' => type,
                  'place' => place,
                }
              }

      client = Stattleship::Client.new(path: path,
                                       query: query)
      json = client.fetch.body

      stat_leaders = Stattleship::StatLeaders.new
      stat_leaders.extend(Stattleship::StatLeadersRepresenter)
      stat_leaders.from_json(json)

      stat_leaders.data
    end

    def data
      @data ||= populate
    end

    private

    def populate
      stat_leaders.each do |leader|
        populate_players(leader)
        populate_teams(leader)
      end
    end

    def populate_players(model)
      model.player = players.detect do |player|
        player.id == model.player_id
      end
    end

    def populate_teams(model)
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

    collection :players, extend: Stattleship::Models::PlayerRepresenter,
                         class: Stattleship::Models::Player
    collection :teams, extend: Stattleship::Models::TeamRepresenter,
                       class: Stattleship::Models::Team
  end
end
