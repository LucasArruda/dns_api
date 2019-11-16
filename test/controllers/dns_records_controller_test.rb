require 'test_helper'

class DnsRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dns_record = dns_records(:one)
  end

  test "should get index" do
    get dns_records_url, as: :json
    assert_response :success
  end
end
