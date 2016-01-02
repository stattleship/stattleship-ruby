require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe StatusValidator do
      describe 'validates' do
        context 'when the status is a known value' do
          it 'passes validation' do
            key = 'status'
            params = { 'status' => 'upcoming' }
            class_name = ''

            validator = StatusValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

            expect {
              validator.validate
            }.not_to raise_error
          end
        end

        context 'when the status is unknown' do
          it 'fails validation' do
            key = 'status'
            params = { 'status' => 'tomorrows' }
            class_name = ''

            validator = StatusValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

            expect {
              validator.validate
            }.to raise_error ArgumentError
          end
        end
      end
    end
  end
end
