require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe BirthDateValidator do
      describe 'validates' do
        it 'is a valid date' do
          key = 'birth_date'
          params = { 'birth_date' => '2016-01-14' }
          class_name = 'Stattleship::Params::PlayersParams'

          validator = BirthDateValidator.new(key: key,
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
