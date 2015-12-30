module Stattleship
  class HockeyStatLeaders < Stattleship::StatLeaders
    HOCKEY_STAT_LEADERS = 'hockey/nhl/stat_leaders'.freeze

    def self.fetch(stat: 'hits',
                   type: 'hockey_defensive_stat',
                   place: 3)

      query = { 'query' => {
                  'stat' => stat,
                  'type' => type,
                  'place' => place,
                }
              }
      client = Stattleship::Client.new(path: HOCKEY_STAT_LEADERS,
                                       query: query)
      json = client.fetch.body

      stat_leaders = Stattleship::StatLeaders.new
      stat_leaders.extend(Stattleship::StatLeadersRepresenter)
      stat_leaders.from_json(json)

      stat_leaders.data
    end
  end
end
