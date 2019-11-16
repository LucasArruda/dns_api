class DnsRecordsController < ApplicationController
  def index
    @dns_records = DnsRecord.all

    render json: @dns_records
  end
