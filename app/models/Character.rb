class Character < ActiveRecord::Base
  has_many :character_cards
  has_many :users, through: :character_cards

  def self.find_character(name)
    self.exists?(name: name)
  end

  def self.find_all_characters
    rows = []
    all_characters = self.all
    all_characters.each do |character|
      rows << ["#{character.name}"]
    end
    table = Terminal::Table.new :headings => ['Characters'],:rows => rows
    puts table
  end

  def self.find_most_prolific_characters
    rows = []
    top_characters = self.order(comics: :desc).limit(5)
    top_characters.each do |character|
      rows << ["#{character.name}", character.comics]
    end
    table = Terminal::Table.new :headings => ['Character', 'Number of Comics Appeared In'],:rows => rows
    puts table
  end

  def self.find_characters_in_most_events
    rows = []
    top_characters = self.order(events: :desc).limit(5)
    top_characters.each do |character|
      rows << ["#{character.name}", character.events]
    end
    table = Terminal::Table.new :headings => ['Character', 'Number of Events Appeared In'],:rows => rows
    puts table
  end

  def self.find_characters_in_most_series
    rows = []
    top_characters = self.order(series: :desc).limit(5)
    top_characters.each do |character|
      rows << ["#{character.name}", character.series]
    end
    table = Terminal::Table.new :headings => ['Character', 'Number of Series Appeared In'],:rows => rows
    puts table
  end

end
