require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe WeekValidator do
      context 'when the value is negative' do
        it 'fails validation' do
          key = 'week'
          params = { 'week' => -3 }
          class_name = ''

          validator = WeekValidator.new(key: key,
                                         params: params,
                                         class_name: class_name)

          expect {
            validator.validates_positive_integer
          }.to raise_error ArgumentError
        end
      end

      context 'when the value is positive' do
        it 'passes validation' do
          key = 'week'
          params = { 'week' => 3 }
          class_name = ''

          validator = WeekValidator.new(key: key,
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
