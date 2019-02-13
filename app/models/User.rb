class User < ActiveRecord::Base
  has_many :character_cards# :tracked_characters
  has_many :characters, through: :character_cards
end
