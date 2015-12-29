require 'spec_helper'

module Stattleship
  RSpec.describe BasketballGameLogs do
    describe '#game_logs' do
      it 'returns all the game_logs' do
        expect(nba_game_logs.count).to eq 3
      end
    end
  end

  RSpec.describe BasketballGameLog do
  end
end
