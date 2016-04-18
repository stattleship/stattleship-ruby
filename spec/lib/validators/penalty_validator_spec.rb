require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe PenaltyValidator do
      describe 'validates' do
        it 'currently does no validation' do
          key = 'penalty'
          params = { 'penalty' => 'foo' }
          class_name = ''

          validator = PenaltyValidator.new(key: key,
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
