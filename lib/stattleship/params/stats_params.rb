module Stattleship
  module Params
    class StatsParams < Stattleship::Params::GameTimeParams
      attr_accessor :game_id, :player_id, :team_id, :stat, :type

      private

      def params
        super.merge('player_id' => player_id,
                    'team_id' => team_id,
                    'game_id' => game_id,
                    'stat' => stat,
                    'type' => type)
      end
    end
  end
end
