class Quote < ActiveRecord::Base

  def self.filter(query)
    character = find_character(query)
    Quote.where(character: character).shuffle[0]
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
