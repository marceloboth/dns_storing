# frozen_string_literal: true

class DnsRecord
  attr_accessor :dns, :hostnames

  def initialize(dns)
    @dns = Dns.new(ip: dns[:ip])
    @hostnames = dns[:hostnames]
  end

  def save
    associate_hostnames_with_dns

    dns.save
  end

  private

  def associate_hostnames_with_dns
    return if hostnames.blank?

    hostnames.each do |hostname|
      dns.hostnames.build(name: hostname)
    end
  end
end
