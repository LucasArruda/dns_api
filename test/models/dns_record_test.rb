require 'test_helper'

class DnsRecordTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:hostnames)

    should accept_nested_attributes_for(:hostnames)
  end

  context 'validations' do
    should validate_presence_of(:ip_address)
  end
end
