module Stattleship
  module Params
    class StatLeadersParams < Stattleship::Params::QueryParams
      attr_accessor :interval_type, :place, :stat

      private

      def params
        super.merge({
                      'interval_type' => interval_type,
                      'stat' => stat,
                      'place' => place,
                    })
      end
    end
  end
end
