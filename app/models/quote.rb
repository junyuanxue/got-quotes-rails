class Quote < ActiveRecord::Base
  validates :content,   uniqueness: true,
                        presence: true,
                        allow_blank: false
  validates :character, presence: true,
                        allow_blank: false

  def self.filter(query)
    characters = find_character(query)
    character = characters.shuffle[0]
    Quote.where(character: character)
  end

  private

  def self.find_character(query)
    characters = Quote.uniq.pluck(:character)
    names = []
    characters.each { |name| names << name if matches?(name, query) }
    names
  end

  def self.matches?(name, query)
    return name.downcase.include?(query.downcase)
  end
end
