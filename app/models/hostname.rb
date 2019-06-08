# frozen_string_literal: true

class Hostname < ApplicationRecord
  has_many :dns_hostnames, dependent: :destroy
  has_many :dns, through: :dns_hostnames

  validates :name, presence: true
end
