module Stattleship
  module Params
    class ScoringPlaysParams < Stattleship::Params::GameLogsParams
      attr_accessor :scoring_method, :scoring_type

      def params
        super.merge('scoring_method' => scoring_method,
                    'scoring_type' => scoring_type)
      end
    end
  end
end
