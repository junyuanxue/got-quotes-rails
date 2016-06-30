require 'rails_helper'

describe 'ApiClient' do
  let!(:data) {'{"quote": "I drink and I know things.", "character": "Tyrion"}'}

  before do
    stub_request(:any, /got-quotes.herokuapp.com/).to_return(body: data, status: 200, headers: {})
  end

  it 'fetches a quote' do
    api_client = ApiClient.new
    response = api_client.get_quote
    quote = {
      'quote': {
        'content': 'I drink and I know things.',
        'character': 'Tyrion'
      }
    }
    expect(response).to eq quote
  end
end
