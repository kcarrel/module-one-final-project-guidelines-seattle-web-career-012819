class Character < ActiveRecord::Base
  has_many :character_cards
  has_many :users, through: :character_cards
  has_many :events, through: :event_cards
  has_many :event_cards

  def self.find_character(name)
    self.exists?(name: name)
  end

  def self.find_all_characters
    rows = self.all.map { |character| ["#{character.name}"] }
    table = Terminal::Table.new :headings => ['Characters'],:rows => rows
    puts table
  end

  def self.find_most_prolific_characters
    top_characters = self.order(comics: :desc).limit(5)
    rows = top_characters.map { |character| ["#{character.name}", character.comics] }
    table = Terminal::Table.new ({
      :headings => ['Character', 'Number of Comics Appeared In'],
      :rows => rows
    })
    puts table
  end

  def self.find_characters_in_most_events
    top_characters = self.order(eventcount: :desc).limit(5)
    rows = top_characters.map { |character| ["#{character.name}", character.eventcount] }
    table = Terminal::Table.new ({
      :headings => ['Character', 'Number of Events Appeared In'],
      :rows => rows
    })
    puts table
  end

  def self.find_characters_in_most_series
    top_characters = self.order(series: :desc).limit(5)
    rows = top_characters.map { |character| ["#{character.name}", character.series] }
    table = Terminal::Table.new ({
      :headings => ['Character', 'Number of Series Appeared In'],
      :rows => rows
    })
    puts table
  end

  def find_events
    rows = self.events.map { |event| ["#{event.name}"] }
    table = Terminal::Table.new :headings => ['Events'],:rows => rows
    puts table
    puts "#{self.name} is in #{self.eventcount} event(s)."
  end

  def show_statistics
    rows = []
    rows << ['Comics appeared in', self.comics]
    rows << ['Series appeared in', self.series]
    rows << ['Events appeared in', self.eventcount]
    table = Terminal::Table.new :headings => ["#{name.upcase}"], :rows => rows
    puts table
  end

end
