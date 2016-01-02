module Stattleship
  module Params
    class TotalPlayerStatParams < Stattleship::Params::QueryParams
      attr_accessor :player_id, :stat, :type

      private

      def params
        {
          'player_id' => player_id,
          'stat' => stat,
          'type' => type,
        }
      end
    end
  end
end
