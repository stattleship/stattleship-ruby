module Stattleship
  class TotalPlayerStat < OpenStruct
    def to_sentence
      "#{player.name} has #{total} #{stat}"
    end

    def self.fetch(path:, params:)
      Stattleship::Client.new(path: path,
                              query: params.query).
        paginate(model: self)
    end

    def data
      @data ||= populate
    end

    private

    def populate
      populate_players(total_player_stat)
      populate_teams(total_player_stat)
      total_player_stat
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

  module TotalPlayerStatRepresenter
    include Roar::JSON

    property :total_player_stat, class: Stattleship::TotalPlayerStat do
      property :player_id
      property :stat
      property :total
    end

    collection :players, extend: Stattleship::Models::PlayerRepresenter,
                         class: Stattleship::Models::Player
    collection :teams, extend: Stattleship::Models::TeamRepresenter,
                       class: Stattleship::Models::Team
  end
end
