module Stattleship
  module Params
    class PenaltiesParams < Stattleship::Params::GameLogsParams
      attr_accessor :penalty

      def params
        super.merge('penalty' => penalty)
      end
    end
  end
end
