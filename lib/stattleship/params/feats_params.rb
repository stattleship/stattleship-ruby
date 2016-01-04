module Stattleship
  module Params
    class FeatsParams < Stattleship::Params::GameTimeParams
      attr_accessor :game_id,
                    :player_id,
                    :team_id,
                    :feat,
                    :level,
                    :level_up

      private

      def params
        super.merge('player_id' => player_id,
                    'team_id' => team_id,
                    'game_id' => game_id,
                    'feat' => feat,
                    'level' => level,
                    'level_up' => level_up)
      end
    end
  end
end
