class DnsRecordsController < ApplicationController
  PAGE_SIZE = 10

  def index

    result = DnsRecord.joins(:hostnames).all
    result = build_query(result).limit(PAGE_SIZE).offset(page_offset)

    render json: DnsRecordsPresenter.new(dns_records: result).to_json
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
      params.require(:dns_record).permit(:ip, :ip_address, hostnames_attributes: [])
    end

    def fetch_params
      params.require(:page)
      params.permit(:page, included: [], excluded: [])
    end

    def build_query(result)
      included = fetch_params[:included]
      excluded = fetch_params[:excluded]

        included.each do |elem|
          result = result.included(elem)
        end if included.present?

        excluded.each do |elem|
          result = result.excluded(elem)
        end if excluded.present?


      result.distinct
    end

    def page_offset
      (fetch_params[:page].to_i-1) * PAGE_SIZE
    end
end
