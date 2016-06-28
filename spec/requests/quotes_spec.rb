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

  describe 'POST /quotes' do
    it 'creates a new quote' do
      new_quote = FactoryGirl.build(:quote)
      post '/quotes',
           set_quote_params(new_quote.content,
                            new_quote.character),
           request_headers

      expect(response.status).to eq 200
      expect(Quote.last.content).to eq new_quote.content
      expect(Quote.last.character).to eq new_quote.character
    end
  end
end
