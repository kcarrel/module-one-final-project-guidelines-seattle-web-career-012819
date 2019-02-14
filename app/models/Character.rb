class Character < ActiveRecord::Base
  has_many :character_cards
  has_many :users, through: :character_cards

  def self.find_all_characters
    puts self.pluck(:name)
  end

  def self.find_most_prolific_characters
    top_characters = self.order(comics: :desc).limit(5)
    puts top_characters.pluck(:name)
  end

  def self.find_characters_in_most_events
    top_characters = self.order(events: :desc).limit(5)
    puts top_characters.pluck(:name)
  end

  def self.find_characters_in_most_series
    top_characters = self.order(series: :desc).limit(5)
    puts top_characters.pluck(:name)
  end

end
