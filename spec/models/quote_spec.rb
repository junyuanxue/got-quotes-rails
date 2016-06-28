require 'rails_helper'

describe Quote, type: :model do
  describe 'filter(character)' do
    let!(:tyrions_quote) { FactoryGirl.create(:quote, character: 'Tyrion')}
    let!(:jons_quote) {FactoryGirl.create(:quote, character: 'Jon Snow')}

    it 'returns a quote by character' do
      expect(Quote.filter('Tyrion')).to eq tyrions_quote
    end

    it 'is not case sensitive' do
      expect(Quote.filter('tyrion')).to eq tyrions_quote
    end

    it 'can target character by their first name' do
      expect(Quote.filter('Jon')).to eq jons_quote
    end
  end
end
