class Quote < ActiveRecord::Base
  validates :content,   uniqueness: true,
                        presence: true
  validates :character, presence: true

  def self.filter(query)
    character = find_character(query)
    Quote.where(character: character)
  end

  private

  def self.find_character(query)
    characters = Quote.uniq.pluck(:character)
    characters.each { |name| return name if matches?(name, query) }
  end

  def self.matches?(name, query)
    return name.downcase.include?(query.downcase)
  end
end
