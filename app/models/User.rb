class User < ActiveRecord::Base
  has_many :character_cards# :tracked_characters
  has_many :characters, through: :character_cards



   def self.find_characters_by_username(name)
     usermatch = self.where(name: name).first
     puts usermatch
     puts usermatch.characters.pluck(:name)
   end

   # def self.find_user_id
   #   self.find_user_by_name(:id)
   # end



  end
