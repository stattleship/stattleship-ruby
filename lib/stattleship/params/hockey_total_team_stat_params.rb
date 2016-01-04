module Stattleship
  module Params
    class HockeyTotalTeamStatParams < TotalTeamStatParams
      private

      def params
        super.merge('type' => 'hockey_team_stat')
      end
    end
  end
end
