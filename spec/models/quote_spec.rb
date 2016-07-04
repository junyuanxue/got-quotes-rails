require 'rails_helper'

describe Quote, type: :model do
  describe 'filter(character)' do
    let!(:tyrions_quote) { FactoryGirl.create(:quote, character: 'Tyrion')}
    let!(:jons_quote) {FactoryGirl.create(:quote, character: 'Jon Snow')}

    it 'returns quotes by character' do
      expect(Quote.filter('Tyrion')).to eq [tyrions_quote]
    end

    it 'is not case sensitive' do
      expect(Quote.filter('tyrion')).to eq [tyrions_quote]
    end

    it 'can target character by their first name' do
      expect(Quote.filter('Jon')).to eq [jons_quote]
    end
  end

  describe 'validation' do
    before do
      FactoryGirl.create(:quote, content: 'I drink and I know things.')
    end

    it 'validates uniqueness of quote content' do
      quote = FactoryGirl.build(:quote, content: 'I drink and I know things.')
      expect(quote.save).to eq false
    end

    it 'validates the presence of quote content' do
      quote = FactoryGirl.build(:quote, content: nil)
      expect(quote.save).to eq false
    end
  end
end
