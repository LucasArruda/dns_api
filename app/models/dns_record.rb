class DnsRecord < ApplicationRecord
  has_many :hostnames
  accepts_nested_attributes_for :hostnames

  validates :ip_address, presence: true
end
