module Stattleship
  module Params
    class BasketballTotalTeamStatParams < Stattleship::Params::TotalTeamStatParams
      private

      def params
        super.merge({ 'type' => 'basketball_team_stat' })
      end
    end
  end
end
