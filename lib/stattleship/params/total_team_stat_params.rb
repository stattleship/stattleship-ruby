module Stattleship
  module Params
    class TotalTeamStatParams < Stattleship::Params::QueryParams
      attr_accessor :team_id, :stat
      attr_reader :type

      private

      def params
        {
          'team_id' => team_id,
          'stat' => stat,
          'type' => type,
        }
      end
    end
  end
end
