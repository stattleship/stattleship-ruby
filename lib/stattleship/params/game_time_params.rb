module Stattleship
  module Params
    class GameTimeParams < Stattleship::Params::QueryParams
      attr_accessor :season_id, :interval_type, :status, :on, :since

      def params
        {
          'season_id' => season_id,
          'interval_type' => interval_type,
          'status' => status,
          'on' => on,
          'since' => since,
        }
      end
    end
  end
end
