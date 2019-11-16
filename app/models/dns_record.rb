class DnsRecord < ApplicationRecord
  has_many :hostnames
  accepts_nested_attributes_for :hostnames

  validates :ip_address, presence: true

  def ip=(ip_address)
    self.ip_address = ip_address
  end
end
