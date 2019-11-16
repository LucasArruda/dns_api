require 'test_helper'

class DnsRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dns_record = dns_records(:one)
  end

  test "should get index" do
    get dns_records_url, as: :json
    assert_response :success
  end

  test "should create dns_record" do
    assert_difference('DnsRecord.count') do
      post dns_records_url, params: {
          dns_record: {
            ip: @dns_record.ip_address,
            hostnames_attributes: {

            }
          }
        }, as: :json
    end

    assert_response 201
  end

  test "created dns_record has id returned" do
    post dns_records_url, params: {
        dns_record: {
          ip: @dns_record.ip_address,
          hostnames_attributes: {

          }
        }
      }, as: :json

    assert @response.body['id'].present?
  end
end
