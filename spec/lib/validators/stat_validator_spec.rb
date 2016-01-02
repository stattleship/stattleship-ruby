require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe StatValidator do
      describe 'validates' do
        context 'when a stat is set with its type' do
         it 'is passes validation' do
            params = {
                       'stat' => 'assists',
                       'type' => 'basketball_offensive_stat'
                     }
            class_name = 'Stattleship::Params::BasketballStatLeadersParams'

            validator = StatValidator.new(key: 'stat',
                                          params: params,
                                          class_name: class_name)

            expect {
              validator.validate
            }.not_to raise_error
         end
        end

        context 'when a stat is set but is missing its type' do
         it 'is fails validation' do
            params = {
                       'stat' => 'assists',
                       'type' => nil
                     }
            class_name = 'Stattleship::Params::BasketballStatLeadersParams'

            validator = StatValidator.new(key: 'stat',
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
