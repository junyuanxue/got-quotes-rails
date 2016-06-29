require 'rails_helper'

describe 'ApiCall' do
  before do
    data = '{
      "quote": "I drink and I know things.",
      "character": "Tyrion"
    }'
    stub_request(:any, /got-quotes.herokuapp.com/).to_return(body: data, status: 200, headers: {})
  end

  it 'fetches a quote' do
    apiCall = ApiCall.new
    response = apiCall.getQuote
    expect(response).to eq data
  end
end
