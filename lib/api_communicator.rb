require 'pry'


  def see_all_characters
    Character.select(:name)
    puts "Would you like to add a character to your saved characters?"
    puts "If so, what is that character's name?"
    add_char_answer = gets.chomp.downcase
    puts add_char_answer
  end
