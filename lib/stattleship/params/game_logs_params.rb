module Stattleship
  module Params
    class GameLogsParams < Stattleship::Params::GameTimeParams
      attr_accessor :player_id, :team_id, :game_id

      def params
        super.merge('player_id' => player_id,
                    'team_id' => team_id,
                    'game_id' => game_id)
      end
    end
  end
end
