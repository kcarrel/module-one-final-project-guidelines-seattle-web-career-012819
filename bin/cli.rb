require 'pry'

class CLI

  def welcome
    puts "Welcome to the Marvel Query Machine!"
    puts "What is your username?"
    user = gets.chomp.downcase
  end

  def menu
    puts "What would you like to do?"
    puts "0. exit"
    puts "1. See my saved characters"
    puts "2. See all characters"
    answer = gets.chomp.downcase

    if answer == "1"
      browse_my_characters
    elsif  answer == "2"
      browse_all_characters
    elsif answer == "0"
      puts "Goodbye!"
      nil
    else
      puts "Please enter a valid number"
      return self.menu
    end
  end

  def browse_my_characters
    puts "What would you like to do?"
    puts "0. exit"
    puts "1. See a list of my saved characters"
    puts "2. See the top 5 most prolific characters I have saved"
    puts "3. See the top 5 of my saved characters that have appeared in the most events"
    puts "4. See the top 5 of my saved characters that have appeared in the most series"
  end


  def browse_all_characters
    puts "What would you like to do?"
    puts "0. exit"
    puts "1. See a list of all characters"
    puts "2. See the top 5 most prolific characters"
    puts "3. See the top 5 characters that have appeared in the most events"
    puts "4. See the top 5 characters that have appeared in the most series"
  end


end
