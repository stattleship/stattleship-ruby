module Stattleship
  module Params
    class BaseballTotalTeamStatParams < TotalTeamStatParams
      private

      def params
        super.merge('type' => 'baseball_team_stat')
      end
    end
  end
end
