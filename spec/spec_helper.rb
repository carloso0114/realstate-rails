require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/support/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.before(:each) do
    employees_response = {
      :status => 'success',
      :data => []
    }
    stub_request(:get, "http://dummy.restapiexample.com/api/v1/employees").
    to_return(status: 200, body: employees_response.to_json)
  end

  config.expect_with :rspec do |expectations|
    
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
