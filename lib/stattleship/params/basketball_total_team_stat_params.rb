module Stattleship
  module Params
    class BasketballTotalTeamStatParams < TotalTeamStatParams
      private

      def params
        super.merge('type' => 'basketball_team_stat')
      end
    end
  end
end
