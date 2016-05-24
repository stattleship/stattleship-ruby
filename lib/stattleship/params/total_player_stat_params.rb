module Stattleship
  module Params
    class TotalPlayerStatParams < Stattleship::Params::GameTimeParams
      attr_accessor :interval_type, :player_id, :stat, :type, :week, :game_id

      private

      def params
        super.merge({
                      'game_id' => game_id,
                      'player_id' => player_id,
                      'stat' => stat,
                      'type' => type,
                    })
      end
    end
  end
end
