require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe RankedValidator do
      context 'when the value is negative' do
        it 'fails validation' do
          key = 'ranked'
          params = { 'ranked' => -3 }
          class_name = ''

          validator = RankedValidator.new(key: key,
                                          params: params,
                                          class_name: class_name)

          expect {
            validator.validates_positive_integer
          }.to raise_error ArgumentError
        end
      end

      context 'when the value is positive' do
        it 'passes validation' do
          key = 'ranked'
          params = { 'ranked' => 3 }
          class_name = ''

          validator = RankedValidator.new(key: key,
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
