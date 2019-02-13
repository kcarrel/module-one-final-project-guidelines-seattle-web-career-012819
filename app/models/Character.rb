class Character < ActiveRecord::Base
  has_many :character_cards
  has_many :users, through: :character_cards

  def self.see_all_characters
    puts self.pluck(:name)
    puts "Would you like to add a character to your saved characters?"
    puts "If so, what is that character's name?"
    add_char_answer = gets.chomp.downcase
    puts add_char_answer
  end

#  has_many :characters through :tracked_characters

end
