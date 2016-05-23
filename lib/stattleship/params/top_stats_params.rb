module Stattleship
  module Params
    class TopStatsParams < Stattleship::Params::QueryParams
      attr_accessor :interval_type, :place, :stat, :type

      private

      def params
        super.merge({
                      'interval_type' => interval_type,
                      'place' => place,
                      'stat' => stat,
                      'type' => type,
                    })
      end
    end
  end
end
