class DnsRecordsPresenter
  def initialize(dns_records:)
    @dns_records = dns_records
  end

  def to_json
    {
      'total_records': @dns_records.size,
      'records': generate_records,
      'related_hostnames': related_hostnames
    }
  end

  private

  def generate_records
    @dns_records.map do |dns_record|
      {
        'id': dns_record.id,
        'ip_address': dns_record.ip_address
      }
    end
  end

  def related_hostnames
    fetch_counted_hostnames.map do |counted_hostname|
      {
        'hostname': counted_hostname.first,
        'count': counted_hostname.last
      }
    end
  end

  def fetch_counted_hostnames
    Hostname
      .where(dns_record: @dns_records)
      .group(:hostname)
      .pluck(Arel.sql 'hostname, count(hostname)')
  end
end
