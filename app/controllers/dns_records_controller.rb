class DnsRecordsController < ApplicationController
  PAGE_SIZE = 10

  def index

    result = DnsRecord.left_joins(:hostnames).all
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
      params.require(:dns_record).permit(:ip, :ip_address, hostnames_attributes: {})
    end

    def fetch_params
      params.require(:page)
      params.permit(:page, included: [], excluded: [])
    end

    def build_query(result)
      included = fetch_params[:included]
      excluded = fetch_params[:excluded]

      if included.present? || excluded.present?
        excluded_records = if excluded.present?
          result.where(
            hostnames: { hostname: excluded }
          )
        end

        result = result.where(
          hostnames: { hostname: included }
        ) if included.present?

        # included_records = if included.present?
        #   result.where(
        #     hostnames: { hostname: included }
        #   )
        # end
        #
        # exclude_from_included = if included.present?
        #   included_records.distinct.map do |dns|
        #     has = dns.hostnames.map(&:hostname).each do |hostname|
        #       break nil unless included.include?(hostname)
        #     end
        #
        #     return dns.id if has
        #     nil
        #   end
        # end

        # included_first_elem = included.shift if included.present?
        # # excluded_first_elem = excluded.shift if excluded.present?
        #
        # included_func = -> { included.map { |elem| "AND hostnames.hostname = '#{elem}'" } }
        # # excluded_func = -> { excluded.map { |elem| "AND hostnames.hostname != '#{elem}'" } }
        #
        # result = result.where(
        #   "hostnames.hostname = '#{included_first_elem}' #{included_func.call.join('')}"
        # ) if included_first_elem

        # result = result.where(
        #   "hostnames.hostname != '#{excluded_first_elem}' #{excluded_func.call.join('')}"
        # ) if excluded_first_elem

        # result = result.where.not(id: exclude_from_included.compact) if exclude_from_included.present?
        result = result.where.not(id: excluded_records) if excluded.present?
      end

      result.distinct
    end

    def page_offset
      (fetch_params[:page].to_i-1) * PAGE_SIZE
    end
end
