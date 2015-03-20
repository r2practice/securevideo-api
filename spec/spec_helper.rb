$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'faraday'
require 'securevideo/api'

require 'webmock/rspec'
require 'timecop'

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = false
end

RSpec.configure do |config|

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
