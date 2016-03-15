require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe StreakLengthValidator do
      context 'when the value is negative' do
        it 'fails validation' do
          key = 'streak_length_'
          params = { 'streak_length_' => -3 }
          class_name = ''

          validator = StreakLengthValidator.new(key: key,
                                         params: params,
                                         class_name: class_name)

          expect {
            validator.validates_positive_integer
          }.to raise_error ArgumentError
        end
      end

      context 'when the value is positive' do
        it 'passes validation' do
          key = 'streak_length_'
          params = { 'streak_length_' => 3 }
          class_name = ''

          validator = StreakLengthValidator.new(key: key,
                                         params: params,
                                         class_name: class_name)

          expect {
            validator.validates_positive_integer
          }.not_to raise_error
        end
      end
    end
  end
end
