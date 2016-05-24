module Stattleship
  module Params
    class TotalTeamStatParams < Stattleship::Params::QueryParams
      attr_accessor :interval_type, :team_id, :stat
      attr_reader :type

      private

      def params
        {
          'interval_type' => interval_type,
          'team_id' => team_id,
          'stat' => stat,
          'type' => type,
        }
      end
    end
  end
end
