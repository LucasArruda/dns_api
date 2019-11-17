require 'test_helper'

class DnsRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dns_record = dns_records(:one)
  end

  test "should get index" do
    get dns_records_url(params: { page: 1 }), as: :json
    assert_response :success
  end

  test "index with missing params" do
    assert_raises ActionController::ParameterMissing do
      get dns_records_url, as: :json
    end
  end

  test "index has correct data format" do
    @hostname = hostnames(:one)
    hostnames(:two).destroy
    hostnames(:three).destroy
    hostnames(:four).destroy
    dns_records(:two).destroy

    get dns_records_url(params: { page: 1 }), as: :json

    response = JSON.parse(@response.body)

    assert response['total_records'] == 1
    assert response['records'].first['ip_address'] == @dns_record.ip_address
    assert response['related_hostnames'].first['hostname'] == @hostname.hostname
  end

  test "index return correct multiple records" do
    get dns_records_url(params: { page: 1 }), as: :json

    response = JSON.parse(@response.body)

    assert response['total_records'] == 2
    assert response['records'].size == 2
    assert response['related_hostnames'].size == 3
  end

  test "index excludes dns records correctly" do
    get dns_records_url(params: { page: 1, excluded: ['ipsum.com'] }), as: :json

    response = JSON.parse(@response.body)

    assert response['total_records'] == 1
    assert response['records'].size == 1
    assert response['related_hostnames'].first['hostname'] != 'ipsum.com'
  end

  # test "index includes dns records correctly" do
  #   @other_dns_record = dns_records(:two)
  #   @hostname_1 = hostnames(:one)
  #   @hostname_2 = hostnames(:two)
  #
  #   get dns_records_url(params: { page: 1, included: ['lorem.com', 'ipsum.com'] }), as: :json
  #
  #   response = JSON.parse(@response.body)
  #
  #   assert response['total_records'] == 1
  #   assert response['records'].size == 1
  #   assert response['records'].first['ip_address'] == @other_dns_record.ip_address
  #   assert response['related_hostnames'].first['hostname'] == @hostname_1.hostname
  #   assert response['related_hostnames'].first['hostname'] == @hostname_2.hostname
  # end

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