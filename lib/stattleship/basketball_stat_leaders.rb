module Stattleship
  class BasketballStatLeaders < Stattleship::StatLeaders
    def self.fetch
      path = 'basketball/nba/stat_leaders?stat=three_pointers_made&type=basketball_offensive_stat&place=2'
      client = Stattleship::Client.new(path: path)
      json = client.fetch.body

      stat_leaders = Stattleship::StatLeaders.new
      stat_leaders.extend(Stattleship::StatLeadersRepresenter)
      stat_leaders.from_json(json)

      stat_leaders.data
    end
  end
end
