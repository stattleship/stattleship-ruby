require 'rspec'
require 'stattleship'
require 'webmock/rspec'

Dir['spec/support/**/*.rb'].each { |file| require file }

WebMock.disable_net_connect!
