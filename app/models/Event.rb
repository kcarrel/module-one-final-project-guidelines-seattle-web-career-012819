class Event < ActiveRecord::Base
  has_many :event_cards
  has_many :characters, through: :event_cards


  def self.find_event(name)
    self.exists?(name: name)
  end

  def self.find_all_events
    rows = self.all.map { |event| ["#{event.name}"] }
    table = Terminal::Table.new :headings => ['Events'],:rows => rows
    puts table
  end

  def find_all_characters
    rows = self.characters.map { |character| ["#{character.name}"] }
    table = Terminal::Table.new :headings => ["Characters in #{self.name}"],:rows => rows
    puts table
  end

end
