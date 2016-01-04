require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe LevelUpValidator do
      context 'when the value is negative' do
        it 'fails validation' do
          key = 'place'
          params = { 'place' => -3 }
          class_name = ''

          validator = LevelUpValidator.new(key: key,
                                         params: params,
                                         class_name: class_name)

          expect {
            validator.validate
          }.to raise_error ArgumentError
        end
      end

      context 'when the value is positive' do
        it 'passes validation' do
          key = 'place'
          params = { 'place' => 3 }
          class_name = ''

          validator = LevelUpValidator.new(key: key,
                                         params: params,
                                         class_name: class_name)

          expect {
            validator.validate
          }.not_to raise_error
        end
      end

      context 'when the value is 0' do
        it 'passes validation' do
          key = 'place'
          params = { 'place' => 0 }
          class_name = ''

          validator = LevelUpValidator.new(key: key,
                                         params: params,
                                         class_name: class_name)

          expect {
            validator.validate
          }.not_to raise_error
        end
      end
    end
  end
end
