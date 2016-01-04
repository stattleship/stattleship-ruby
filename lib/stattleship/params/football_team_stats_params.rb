module Stattleship
  module Params
    class FootballTeamStatsParams < Stattleship::Params::FootballStatsParams
      def params
        super.merge('type' => 'football_team_stat').
          delete_if { |key| key == 'player_id' }
      end
    end
  end
end
