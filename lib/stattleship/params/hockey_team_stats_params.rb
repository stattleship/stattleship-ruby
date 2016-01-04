module Stattleship
  module Params
    class HockeyTeamStatsParams < Stattleship::Params::HockeyStatsParams
      def params
        super.merge('type' => 'hockey_team_stat').
          delete_if { |key| key == 'player_id' }
      end
    end
  end
end
