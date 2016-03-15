module Stattleship
  module Params
    class TeamOutcomeStreaksParams < Stattleship::Params::QueryParams
      attr_accessor :current,
                    :interval_type,
                    :outcome,
                    :rank,
                    :ranked,
                    :season_id,
                    :streak_length,
                    :team_id
      def params
        super.merge('current' => current,
                    'interval_type' => interval_type,
                    'outcome' => outcome,
                    'rank' => rank,
                    'ranked' => ranked,
                    'season_id' => season_id,
                    'streak_length' => streak_length,
                    'team_id' => team_id)
      end
    end
  end
end
