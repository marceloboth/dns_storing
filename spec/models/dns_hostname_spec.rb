# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DnsHostname, type: :model do
  context 'with associations' do
    it { is_expected.to belong_to(:dns) }
    it { is_expected.to belong_to(:hostname) }
  end
end
