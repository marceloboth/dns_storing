# frozen_string_literal: true

class DnsHostname < ApplicationRecord
  belongs_to :dns
  belongs_to :hostname
end
