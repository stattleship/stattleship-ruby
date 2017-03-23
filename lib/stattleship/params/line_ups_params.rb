module Stattleship
  module Params
    class LineUpsParams < Stattleship::Params::GameTimeParams
      attr_accessor :inning,
                    :player_id,
                    :team_id,
                    :game_id

      def params
        super.merge('game_id' => game_id,
                    'team_id' => team_id,
                    'player_id' => player_id,
                    'inning' => inning,
                   )
      end
    end
  end
end
