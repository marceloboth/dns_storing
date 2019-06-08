# frozen_string_literal: true

class Dns < ApplicationRecord
  has_many :dns_hostnames, dependent: :destroy
  has_many :hostnames, through: :dns_hostnames

  validates :ip, presence: true
  validates :hostnames, presence: true
end
