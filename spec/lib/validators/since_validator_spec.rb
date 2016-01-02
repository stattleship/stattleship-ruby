require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe SinceValidator do
      describe 'validates' do
        it 'currently does no validation' do
          key = 'since'
          params = { 'since' => 'foo' }
          class_name = ''

          validator = SinceValidator.new(key: key,
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
