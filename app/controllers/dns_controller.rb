# frozen_string_literal: true

class DnsController < ApplicationController
  def index
    render json: Dns.select(:id)
  end

  def create
    dns_record = DnsRecord.new(dns_params)

    if dns_record.save
      render json: { id: dns_record.dns.id }, status: :created
    else
      render json: { errors: dns_record.dns.errors }, status: :unprocessable_entity
    end
  end

  private

  def dns_params
    params.require(:dns).permit(:ip, hostnames: [])
  end
end
