class Character < ActiveRecord::Base
  has_many :character_cards
  has_many :users, through: :character_cards
  has_many :events, through: :event_cards
  has_many :event_cards

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
    top_characters = self.order(eventcount: :desc).limit(5)
    top_characters.each do |character|
      rows << ["#{character.name}", character.eventcount]
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

  def self.find_events_by_character_name(name)
    rows = []
    charactermatch = self.where(name: name).first
    character_events = charactermatch.events
    character_events.each do |event|
      rows << ["#{event.name}"]
    end
    table = Terminal::Table.new :headings => ['Events'],:rows => rows
    puts table
    puts "#{name} is in #{charactermatch.eventcount} event(s)."
  end

  def self.show_statistics(name)
    charactermatch = self.where(name: name).first
    rows = []
    rows << ['Comics appeared in', charactermatch.comics]
    rows << ['Series appeared in', charactermatch.series]
    rows << ['Events appeared in', charactermatch.eventcount]
    table = Terminal::Table.new :headings => ["#{name.upcase}"], :rows => rows
    puts table
  end

end
