module Stattleship
  module Models
    class Pitch < OpenStruct
      def to_sentence
        description
      end

      def pitcher_name
        if pitcher
          pitcher.full_name
        end
      end

      def hitter_name
        if hitter
          hitter.full_name
        end
      end

      def hitter_team_name
        if hitter_team
          hitter_team.name
        end
      end

      def team_name
        if team
          team.name
        end
      end

      def at_bat?
        is_at_bat
      end

      def at_bat_over?
        is_at_bat_over
      end

      def bunt?
        is_bunt
      end

      def bunt_shown?
        is_bunt_shown
      end

      def double_play?
        is_double_play
      end

      def hit?
        is_hit
      end

      def on_base?
        is_on_base
      end

      def passed_ball?
        is_passed_ball
      end

      def triple_play?
        is_triple_play
      end

      def wild_pitch?
        is_wild_pitch
      end

      def even_count?
        if at_bat_pitch_count > 0
          at_bat_balls == at_bat_strikes
        else
          false
        end
      end

      def full_count?
        (at_bat_balls == 3) &&
        (at_bat_strikes == 2)
      end

      def hitter_pitch_count
        "#{at_bat_balls}-#{at_bat_strikes}"
      end

      def inning_half_label
        case half
        when 'B'
          'Bottom of'
        when 'T'
          'Top of'
        else
          ''
        end
      end

      def ordinal_inning
        inning.ordinalize
      end

      def inning_label
        if inning
          "#{inning_half_label} #{ordinal_inning}"
        end
      end

      def description
        [pitch_description, hit_description].compact.join("\n\n")
      end

      def pitch_description
        if (pitch_type != 'IB' && pitch_speed.to_i > 0)
          [
            "#{hitter_name} at bat. #{pitcher_name} throws a #{pitch_speed.to_i} mph #{pitch_name}. #{pitch_outcome}.",
            "#{hitter_name} batting. #{pitcher_name} with a #{pitch_speed.to_i} mph #{pitch_name}. #{pitch_outcome}.",
            "#{pitcher_name} pitching to #{hitter_name}. #{pitch_speed.to_i} mph #{pitch_name} for a #{pitch_outcome}.",
            "#{pitcher_name} throws a #{pitch_speed.to_i} mph #{pitch_name} to #{hitter_name}. #{pitch_outcome}.",
          ].sample
        elsif pitch_type == 'IB'
          "#{pitcher_name} pitching to #{hitter_name}. #{pitch_name}."
        elsif !pitch_name == ''
          "#{hitter_name} up to bat. #{pitcher_name} throws a #{pitch_name} to #{hitter_name}."
        elsif !pitch_outcome == ''
          "#{pitcher_name} pitching to #{hitter_name}. #{pitch_outcome}."
        else
          "#{pitcher_name} pitching to #{hitter_name}."
        end
      end

      def hit_name
        case hit_type
        when 'GB'
          'Ground Ball'
        when 'FB'
          'Fly Ball'
        when 'PU'
          'Pop Fly'
        when 'LD'
          'Line Drive'
        else
          'Hit'
        end
      end

      def hit_location_name
        case hit_location
        when '1'
          ' to left'
        when '2'
          ' to left center'
        when '3'
          ' to center'
        when '4'
          ' to right center'
        when '5'
          ' to right'
        when '6'
          ' to deep left field'
        when '7'
          ' to deep left center'
        when '8'
          ' to deep center field'
        when '9'
          ' to deep right center'
        when '10'
          ' to deep right field'
        when '11'
          ' to left field'
        when '12'
          ' to left center alley'
        when '13'
          ' to center field'
        when '14'
          ' to right center alley'
        when '15'
          ' to right field'
        when '16'
          ' to shallow left field'
        when '17'
          ' to shallow left center'
        when '18'
          ' to shallow center'
        when '19'
          ' to shallow right center'
        when '20'
          ' to shallow right'
        when '21'
          ' to third'
        when '22'
          ' to short'
        when '23'
          ' to second'
        when '24'
          ' to first'
        when '25'
          ' to left infield grass'
        when '26'
          ' to right infield grass'
        when '27'
          ' to pitcher'
        when '28'
          " to catcher's left"
        when '29'
          ' infront of the catcher'
        when '30'
          " to catcher's right"
        when '31'
          ' to left field foul'
        when '32'
          ' to third base foul'
        when '33'
          'behind the catcher'
        when '34'
          ' to first base foul'
        when '35'
          ' to right field foul'
        else
          nil
        end
      end

      def hit_description
        if is_hit?
          "#{hit_name}#{hit_location_name}."
        else
          "#{hit_name}#{hit_location_name}." if hit_location_name
        end
      end

      def title
        @title = []

        @title << game.scoreline
        @title << inning_label

        unless hitter_pitch_count == '0-0'
          @title << "#{hitter_pitch_count} count"
        end

        if at_bat_outs && at_bat_outs > 0
          @title << "#{h.pluralize(at_bat_outs, 'out')}"
        end

        if pitch_count && pitch_count > 0
          @title << "#{pitch_count.ordinalize} pitch"
        end

        @title.join(' | ')
      end


      def dump
        {
          id: id,
          half: half,
          hit_location: hit_location,
          hit_type: hit_type,
          inning_label: inning_label,
          pitch_name: pitch_name,
          pitch_outcome: pitch_outcome,
          pitch_outcome_type: pitch_outcome_type,
          pitch_type: pitch_type,
          at_bat_balls: at_bat_balls,
          at_bat_outs: at_bat_outs,
          at_bat_pitch_count: at_bat_pitch_count,
          at_bat_strikes: at_bat_strikes,
          even_count: even_count,
          full_count: full_count,
          hitter_pitch_count: hitter_pitch_count,
          inning: inning,
          sequence: sequence,
          pitch_speed: pitch_speed,
          pitch_count: pitch_count,
          pitch_zone: pitch_zone,
          is_at_bat: is_at_bat,
          is_at_bat_over: is_at_bat_over,
          is_bunt: is_bunt,
          is_bunt_shown: is_bunt_shown,
          is_double_play: is_double_play,
          is_hit: is_hit,
          is_on_base: is_on_base,
          is_passed_ball: is_passed_ball,
          is_triple_play: is_triple_play,
          is_wild_pitch: is_wild_pitch,
          pitched_at: pitched_at,
          event_id: event_id,
          game_id: game_id,
          team_id: team_id,
          pitcher_id: pitcher_id,
          hitter_id: hitter_id,
          hitter_team_id: hitter_team_id,
          pitcher_name: pitcher_name,
        }
      end
    end

    module PitchRepresenter
      include Roar::JSON
      include Roar::Coercion
      include Virtus.model

      [
        :id,
        :half,
        :hit_location,
        :hit_type,
        :inning_label,
        :pitch_name,
        :pitch_outcome,
        :pitch_outcome_type,
        :pitch_type,
      ].each do |attribute|
        property attribute
      end

      [
        :at_bat_balls,
        :at_bat_outs,
        :at_bat_pitch_count,
        :at_bat_strikes,
        :even_count,
        :full_count,
        :hitter_pitch_count,
        :inning,
        :sequence,
        :pitch_speed,
        :pitch_count,
        :pitch_zone,
      ].each do |attribute|
        property attribute, type: Integer
      end

      [
        :is_at_bat,
        :is_at_bat_over,
        :is_bunt,
        :is_bunt_shown,
        :is_double_play,
        :is_hit,
        :is_on_base,
        :is_passed_ball,
        :is_triple_play,
        :is_wild_pitch,
      ].each do |attribute|
        property attribute, type: Boolean, default: false
      end

      [
        :pitched_at,
      ].each do |attribute|
        property attribute, type: DateTime
      end

      [
        :event_id,
        :game_id,
        :team_id,
        :pitcher_id,
        :hitter_id,
        :hitter_team_id,
      ].each do |relationship|
        property relationship
      end
    end
  end
end
