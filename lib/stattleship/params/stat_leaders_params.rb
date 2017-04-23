module Stattleship
  module Params
    class StatLeadersParams < Stattleship::Params::QueryParams
      attr_accessor :interval_type, :place, :stat, :type

      private

      def params
        super.merge({
                      'interval_type' => interval_type,
                      'stat' => stat,
                      'type' => type,
                      'place' => place,
                    })
      end
    end
  end
end
