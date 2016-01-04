module Stattleship
  module Params
    class TeamGameLogsParams < Stattleship::Params::GameTimeParams
      attr_accessor :team_id, :game_id

      def params
        super.merge('team_id' => team_id,
                    'game_id' => game_id)
      end
    end
  end
end
