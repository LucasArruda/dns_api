class DnsRecord < ApplicationRecord
  has_many :hostnames
  validates :ip_address, presence: true
end
