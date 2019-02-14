class Character < ActiveRecord::Base
  has_many :character_cards
  has_many :users, through: :character_cards

  def self.find_all_characters
    puts self.pluck(:name)
  end

  def self.find_most_prolific_characters
    top_characters = self.order(comics: :desc).limit(5)
    puts top_characters.pluck(:name)
  end

  def self.find_characters_in_most_events
    top_characters = self.order(events: :desc).limit(5)
    puts top_characters.pluck(:name)
  end

  def self.find_characters_in_most_series
    top_characters = self.order(series: :desc).limit(5)
    puts top_characters.pluck(:name)
  end
    #puts "Would you like to add a character to your saved characters?"
    #puts "(y/n)"
    #answer = gets.chomp.downcase
  #  if answer == 'y'
    #  self.create_character_card
    #elsif answer == 'n'
      #{}"Goodbye!"
    #  nil #maybe?
  #  else
      #puts "Please choose 'y' or 'n'!"
  #  end

  #end
#  def self.create_character_card
  #  puts "What is the name of the character you would like to save?"
    #add_char_answer = gets.chomp.downcase
    #CharacterCard.new()
  #end

end
