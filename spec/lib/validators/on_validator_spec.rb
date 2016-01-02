require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe OnValidator do
      describe 'validates' do
        it 'currently does no validation' do
          key = 'on'
          params = { 'on' => 'foo' }
          class_name = ''

          validator = OnValidator.new(key: key,
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
