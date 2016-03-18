module Stattleship
  module Params
    class BaseballTeamStatsParams < Stattleship::Params::BaseballStatsParams
      def params
        super.merge('type' => 'baseball_team_stat').
          delete_if { |key| key == 'player_id' }
      end
    end
  end
end
