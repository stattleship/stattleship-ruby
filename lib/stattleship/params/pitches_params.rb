module Stattleship
  module Params
    class PitchesParams < Stattleship::Params::GameTimeParams
      attr_accessor :pitch_outcome_type, :pitcher_id, :inning

      def params
        super.merge('pitch_outcome_type' => pitch_outcome_type,
                    'pitcher_id' => pitcher_id,
                    'inning' => inning)
      end
    end
  end
end
