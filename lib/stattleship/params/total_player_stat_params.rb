module Stattleship
  module Params
    class TotalPlayerStatParams < Stattleship::Params::QueryParams
      attr_accessor :interval_type, :player_id, :stat, :type

      private

      def params
        super.merge({
                      'interval_type' => interval_type,
                      'player_id' => player_id,
                      'stat' => stat,
                      'type' => type,
                    })
      end
    end
  end
end
