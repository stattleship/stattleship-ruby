module Stattleship
  module Models
    class Scoreboard < OpenStruct
      def to_sentence
        title
      end

      def dump
        {
        }
      end
    end

    module ScoreboardRepresenter
      include Roar::JSON
      include Roar::Coercion
      include Virtus.model

      [
        :game_id,
      ].each do |attribute|
        property attribute
      end

      [
        :id,
        :away_description,
        :away_team_outcome,
        :away_team_verb,
        :broadcast,
        :clock,
        :home_description,
        :home_team_outcome,
        :home_team_verb,
        :period_label,
        :score,
        :status,
        :title,
        :week_label,
      ].each do |attribute|
        property attribute
      end

      [
        :clock_seconds,
        :game_clock_seconds,
        :away_team_score,
        :home_team_score,
        :clock_seconds,
        :period,
        :points,
      ].each do |attribute|
        property attribute, type: Integer
      end

      [
        :game_over,
      ].each do |attribute|
        property attribute, type: Boolean, default: false
      end
    end
  end
end
