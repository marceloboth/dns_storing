# frozen_string_literal: true

FactoryBot.define do
  factory :dns_hostname do
    dns { nil }
    hostname { nil }
  end
end
