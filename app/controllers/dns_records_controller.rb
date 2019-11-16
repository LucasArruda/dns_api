class DnsRecordsController < ApplicationController
  def index
    @dns_records = DnsRecord.all

    render json: @dns_records
  end
  def create
    @dns_record = DnsRecord.new(dns_record_params)

    if @dns_record.save
      render json: { id: @dns_record.id }, status: :created
    else
      render json: @dns_record.errors, status: :unprocessable_entity
    end
  end

  private
    def dns_record_params
      params.require(:dns_record).permit(:ip, :ip_address, hostnames_attributes: {})
    end
end
