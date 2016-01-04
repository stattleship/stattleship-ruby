module Stattleship
  module Params
    class FootballGameLogsParams < Stattleship::Params::GameLogsParams
      attr_accessor :week

      def params
        super.merge('week' => week)
      end
    end
  end
end
