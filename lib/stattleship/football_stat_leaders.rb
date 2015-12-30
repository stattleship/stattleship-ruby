module Stattleship
  class FootballStatLeaders < Stattleship::StatLeaders
    def self.fetch
      path = 'football/nfl/stat_leaders?stat=passes_touchdowns&type=football_passing_stat&place=4'
      client = Stattleship::Client.new(path: path)
      json = client.fetch.body

      stat_leaders = Stattleship::StatLeaders.new
      stat_leaders.extend(Stattleship::StatLeadersRepresenter)
      stat_leaders.from_json(json)

      stat_leaders.data
    end
  end
end
