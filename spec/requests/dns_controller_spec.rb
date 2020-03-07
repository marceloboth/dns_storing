# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DnsController do
  describe 'POST #create' do
    let(:dns_params) do
      { ip: '1.1.1.1', hostnames: ['lorem.com', 'ipsum.com', 'dolor.com', 'amet.com'] }
    end

    let(:invalid_dns_params) do
      { ips: '', domains: [] }
    end

    context 'with valid request params' do
      before do
        post '/dns', params: { dns: dns_params }
      end

      it 'creates a DNS record' do
        expect do
          post '/dns', params: { dns: dns_params }
        end.to change(Dns, :count).by(1)
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(json_body[:id]).to eq(1) }
    end

    context 'with invalid request params' do
      before do
        post '/dns', params: { dns: invalid_dns_params }
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(json_body[:errors][:ip].first).to eq("can't be blank") }
      it { expect(json_body[:errors][:hostnames].first).to eq("can't be blank") }
    end
  end
end
