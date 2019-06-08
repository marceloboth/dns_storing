# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dns, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of :ip }
  end

  context 'with associations' do
    it { is_expected.to have_many(:dns_hostnames) }
    it { is_expected.to have_many(:hostnames).through(:dns_hostnames) }
  end
end
