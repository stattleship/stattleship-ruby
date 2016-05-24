require 'spec_helper'

module Stattleship
  module Params
    RSpec.describe TotalTeamStatParams do
      describe '#query' do
        it 'defines a query hash of parameters' do
          params = TotalTeamStatParams.new

          params.team_id = 'nhl-bos'
          params.stat = 'shots'
          params.season_id = 'nhl-2015-2016'
          params.interval_type = 'regularseason'
          params.week = nil
          params.status = 'ended'
          params.since = '1 week ago'
        end
      end
    end
  end
end
