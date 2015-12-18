require 'spec_helper'

module Stattleship
  RSpec.describe Configuration do
    context 'un-configured' do
      it 'returns the configuration object' do
        configuration = Stattleship.configure

        expect(configuration).to be_a(Configuration)
      end

      describe '#base_uri' do
        it 'defaults to a preset url if none is set' do
          config = Stattleship.configuration

          expect(config.base_uri).to eq(URI('https://stattleship.com'))
        end
      end
    end

    context 'fully-configured' do
      before(:each) do
        Stattleship.configure do |config|
          config.api_token = 'abc123'
          config.base_uri = URI('https://stattleship.com')
        end
      end

      it 'returns the configuration object' do
        configure = Stattleship.configure
        configuration = Stattleship.configuration

        expect(configure).to be_a(Configuration)
        expect(configure).to be(configuration)
      end

      it 'sets the config values' do
        config = Stattleship.configuration

        expect(config.api_token).to eq('abc123')
        expect(config.base_uri).to eq(URI('https://stattleship.com'))
      end
    end
  end
end
