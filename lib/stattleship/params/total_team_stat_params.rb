module Stattleship
  module Params
    class TotalTeamStatParams < Stattleship::Params::GameTimeParams
      attr_accessor :interval_type, :team_id, :stat, :game_id
      attr_reader :type

      private

      def params
        {
          'game_id' => game_id,
          'team_id' => team_id,
          'stat' => stat,
          'type' => type,
        }
      end
    end
  end
end
