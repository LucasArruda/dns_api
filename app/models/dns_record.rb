class DnsRecord < ApplicationRecord
  has_many :hostnames
  accepts_nested_attributes_for :hostnames

  validates :ip_address, presence: true
  def self.excluded(item)
    _dns_record = DnsRecord.arel_table
    _hostname = Hostname.arel_table
    where.not(Hostname.where(_hostname[:hostname].eq(item)).where(
      'hostnames.dns_record_id = dns_records.id'
    ).exists)
  end

  def self.included(item)
    _dns_record = DnsRecord.arel_table
    _hostname = Hostname.arel_table
    where(Hostname.where(_hostname[:hostname].eq(item)).where(
      'hostnames.dns_record_id = dns_records.id'
    ).exists)
  end

  def ip=(ip_address)
    self.ip_address = ip_address
  end
end
