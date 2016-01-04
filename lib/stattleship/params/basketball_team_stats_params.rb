module Stattleship
  module Params
    class BasketballTeamStatsParams < Stattleship::Params::BasketballStatsParams
      def params
        super.merge('type' => 'basketball_team_stat').
          delete_if { |key| key == 'player_id' }
      end
    end
  end
end
