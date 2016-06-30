require 'rails_helper'

describe 'quotes' do
  it 'adds a new quote when fetch quote button is clicked' do
    visit '/'
    click_button 'Fetch Quote'
    expect(Quote.all.length).to eq 1
  end
end
