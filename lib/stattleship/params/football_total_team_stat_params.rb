module Stattleship
  module Params
    class FootballTotalTeamStatParams < TotalTeamStatParams
      private

      def params
        super.merge('type' => 'football_team_stat')
      end
    end
  end
end
