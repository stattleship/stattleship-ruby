module Stattleship
  module Params
    class RankingsParams < Stattleship::Params::QueryParams
      attr_accessor :on, :place, :ranking

      def params
        {
          'on' => on,
          'place' => place,
          'ranking' => ranking,
        }
      end
    end
  end
end
