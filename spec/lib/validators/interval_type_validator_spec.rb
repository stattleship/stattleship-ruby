require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe IntervalTypeValidator do
      describe 'validates' do
        it 'currently does no validation' do
          key = 'interval_type'
          params = { 'interval_type' => 'foo' }
          class_name = ''

          validator = IntervalTypeValidator.new(key: key,
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
