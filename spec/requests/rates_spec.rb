require 'rails_helper'

RSpec.describe 'Rates', type: :request do
  it 'Rate requester should return valid data' do
    expect(RateRequester.new.rate.class).to be(Float)
  end
end
