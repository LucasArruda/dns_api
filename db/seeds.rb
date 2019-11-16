# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


dns_record_1 = DnsRecord.create(ip: '1.1.1.1', hostnames_attributes: [
  {
    'hostname': 'lorem.com'
  },
  {
    'hostname': 'ipsum.com'
  },
  {
    'hostname': 'dolor.com'
  },
  {
    'hostname': 'amet.com'
  }
])

dns_record_2 = DnsRecord.create(ip: '2.2.2.2', hostnames_attributes: [
  {
    'hostname': 'ipsum.com'
  }
])

dns_record_3 = DnsRecord.create(ip: '3.3.3.3', hostnames_attributes: [
  {
    'hostname': 'ipsum.com'
  },
  {
    'hostname': 'dolor.com'
  },
  {
    'hostname': 'amet.com'
  }
])

dns_record_4 = DnsRecord.create(ip: '4.4.4.4', hostnames_attributes: [
  {
    'hostname': 'ipsum.com'
  },
  {
    'hostname': 'dolor.com'
  },
  {
    'hostname': 'sit.com'
  },
  {
    'hostname': 'amet.com'
  }
])

dns_record_5 = DnsRecord.create(ip: '5.5.5.5', hostnames_attributes: [
  {
    'hostname': 'dolor.com'
  },
  {
    'hostname': 'sit.com'
  }
])
