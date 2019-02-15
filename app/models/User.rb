class User < ActiveRecord::Base
  has_many :character_cards# :tracked_characters
  has_many :characters, through: :character_cards

  def self.find_user(name)
    self.exists?(name: name)
  end

  def self.find_all_users
    puts self.pluck(:name)
  end

   def self.find_characters_by_username(name)
     rows = []
     usermatch = self.where(name: name).first
     user_characters = usermatch.characters
     user_characters.each do |character|
       rows << ["#{character.name}"]
     end
     table = Terminal::Table.new :headings => ['Characters'],:rows => rows
     puts table
   end

   def self.find_most_prolific_characters(name)
     rows = []
     usermatch = self.where(name: name).first
     top_characters = usermatch.characters.order(comics: :desc).limit(5)
     top_characters.each do |character|
       rows << ["#{character.name}", character.comics]
     end
   table = Terminal::Table.new :headings => ['Character', 'Number of Comics Appeared In'],:rows => rows
   puts table
   end

   def self.find_characters_in_most_events(name)
     rows = []
     usermatch = self.where(name: name).first
     top_characters = usermatch.characters.order(eventcount: :desc).limit(5)
     top_characters.each do |character|
       rows << ["#{character.name}", character.eventcount]
     end
   table = Terminal::Table.new :headings => ['Character', 'Number of Events Appeared In'],:rows => rows
   puts table
  end

   def self.find_characters_in_most_series(name)
     rows = []
     usermatch = self.where(name: name).first
     top_characters = usermatch.characters.order(series: :desc).limit(5)
     top_characters.each do |character|
       rows << ["#{character.name}", character.series]
     end
   table = Terminal::Table.new :headings => ['Character', 'Number of Series Appeared In'],:rows => rows
   puts table
  end

end
