class Event < ActiveRecord::Base
  has_many :event_cards
  has_many :characters, through: :event_cards


  def self.find_event(name)
    self.exists?(name: name)
  end

  def self.find_all_events
    rows = []
    all_events = self.all
    all_events.each do |event|
      rows << ["#{event.name}"]
    end
    table = Terminal::Table.new :headings => ['Events'],:rows => rows
    puts table
  end

  def self.find_all_characters_in_event(name)
    rows = []
    eventmatch = self.where(name: name).first
    event_characters = eventmatch.characters
    event_characters.each do |character|
      rows << ["#{character.name}"]
    end
    table = Terminal::Table.new :headings => ["Characters in #{name}"],:rows => rows
    puts table
  end

end
