module Stattleship
  module Params
    class GameLogsParams < Stattleship::Params::QueryParams
      attr_accessor :player_id, :team_id

      def params
        {
          'player_id' => player_id,
          'team_id' => team_id,
        }
      end
    end
  end
end
