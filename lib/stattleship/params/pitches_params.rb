module Stattleship
  module Params
    class PitchesParams < Stattleship::Params::GameTimeParams
      attr_accessor :hitter_id,
                    :pitch_outcome_type,
                    :pitcher_id,
                    :inning,
                    :game_id,
                    :team_id,
                    :hitter_team_id,
                    :lower_speed,
                    :upper_speed,
                    :speed,
                    :speed_and_over,
                    :speed_and_under,
                    :pitch_type,
                    :hit_location,
                    :hit_type

      def params
        super.merge('game_id' => game_id,
                    'hitter_id' => hitter_id,
                    'pitcher_id' => pitcher_id,
                    'team_id' => team_id,
                    'hitter_team_id' => hitter_team_id,
                    'inning' => inning,
                    'pitch_outcome_type' => pitch_outcome_type,
                    'lower_speed' => lower_speed,
                    'upper_speed' => upper_speed,
                    'speed' => speed,
                    'speed_and_over' => speed_and_over,
                    'speed_and_under' => speed_and_under,
                    'pitch_type' => pitch_type,
                    'hit_location' => hit_location,
                    'hit_type' => hit_type,
                   )
      end
    end
  end
end
