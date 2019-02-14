class User < ActiveRecord::Base
  has_many :character_cards# :tracked_characters
  has_many :characters, through: :character_cards


   def self.find_characters_by_username(name)
     usermatch = self.where(name: name).first
     puts usermatch
     puts usermatch.characters.pluck(:name)
   end

   def self.find_most_prolific_characters(name)
     usermatch = self.where(name: name).first
     top_characters = usermatch.characters.order(comics: :desc).limit(5)
     puts top_characters.pluck(:name)
   end

   def self.find_characters_in_most_events(name)
     usermatch = self.where(name: name).first
     top_characters = usermatch.characters.order(events: :desc).limit(5)
     puts top_characters.pluck(:name)
   end

   def self.find_characters_in_most_series(name)
     usermatch = self.where(name: name).first
     top_characters = usermatch.characters.order(series: :desc).limit(5)
     puts top_characters.pluck(:name)
  end

end 
