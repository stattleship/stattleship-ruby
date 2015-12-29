module Endpoints
  def leaders
    stat_leaders = Stattleship::StatLeaders.new
    stat_leaders.extend(Stattleship::StatLeadersRepresenter)

    json = File.read('spec/fixtures/nhl/stat_leaders.json')

    stat_leaders.from_json(json)
    stat_leaders.leaders
  end
end
