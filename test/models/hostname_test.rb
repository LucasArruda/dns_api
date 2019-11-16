require 'test_helper'

class HostnameTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:dns_record)
  end

  context 'validations' do
    should validate_presence_of(:dns_record)
    should validate_presence_of(:hostname)
  end
end
