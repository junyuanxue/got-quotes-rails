require 'rails_helper'

describe 'quotes API' do
  let!(:request_headers) { { 'Accept': 'application/json',
                             'Content-Type': 'application/json' } }
  let!(:quote) { FactoryGirl.create(:quote) }

  describe 'GET /quotes' do
    it 'returns a quote' do
      get '/quotes', {}, { 'Accept': 'application/json' }

      expect(response.status).to eq 200

      quote_data = JSON.parse(response.body)
      expect(quote_data['content']).to eq quote.content
      expect(quote_data['character']).to eq quote.character
    end
  end

end
