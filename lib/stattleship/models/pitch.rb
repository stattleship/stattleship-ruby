module Stattleship
  module Models
    class Pitch < OpenStruct
      def to_sentence
        ''
      end

      def dump
        {
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
