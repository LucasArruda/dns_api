class Hostname < ApplicationRecord
  belongs_to :dns_record

  validates :dns_record, :hostname, presence: true
end
