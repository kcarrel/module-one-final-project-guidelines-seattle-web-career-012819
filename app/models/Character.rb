class Character < ActiveRecord::Base
  has_many :character_cards
  has_many :users, through: :character_cards

  def self.see_all_characters
    puts self.pluck(:name)
    puts "Would you like to add a character to your saved characters?"
    puts "(y/n)"
    answer = gets.chomp.downcase
    if answer == 'y'
      self.create_character_card
    elsif answer == 'n'
      "Goodbye!"
      nil #maybe?
    else
      puts "Please choose 'y' or 'n'!"
    end

  end
  def self.create_character_card
    puts "What is the name of the character you would like to save?"
    add_char_answer = gets.chomp.downcase
    CharacterCard.new()
  end

end
