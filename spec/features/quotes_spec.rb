require 'rails_helper'

describe 'quotes' do
  let!(:data) {'{"quote": "I drink and I know things.", "character": "Tyrion"}'}

  before do
    stub_request(:get, /got-quotes.herokuapp.com/).
      to_return(body: data, status: 200, headers: {})
  end

  it 'adds a new quote when fetch quote button is clicked' do
    visit '/quotes/new'
    click_button 'Fetch Quote'
    expect(Quote.all.length).to eq 1
  end
end
