module Stattleship
  module Params
    class HockeyTotalTeamStatParams < Stattleship::Params::TotalTeamStatParams
      private

      def params
        super.merge({ 'type' => 'hockey_team_stat' })
      end
    end
  end
end
