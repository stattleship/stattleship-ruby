require 'spec_helper'

module Stattleship
  RSpec.describe Configuration do
    context 'un-configured' do
      it 'returns the configuration object' do
        configuration = Stattleship.configure

        expect(configuration).to be_a(Configuration)
      end
    end

    context 'pre-configured' do
      before(:each) do
        Stattleship.configure do |config|
          config.api_token = 'abc123'
        end
      end

      it 'returns the configuration object' do
        configure = Stattleship.configure
        configuration = Stattleship.configuration

        expect(configure).to be_a(Configuration)
        expect(configure).to be(configuration)
      end

      describe 'api_token' do
        it 'sets the api token' do
          key = Stattleship.configuration.api_token

          expect(key).to eq('abc123')
        end
      end
    end
  end
end
