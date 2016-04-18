require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe ScoringTypeValidator do
      describe 'validates' do
        it 'currently does no validation' do
          key = 'scoring_type'
          params = { 'scoring_type' => 'foo' }
          class_name = ''

          validator = ScoringTypeValidator.new(key: key,
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
