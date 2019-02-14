require 'pry'

class CLI
  attr_accessor :username, :character_name

  def welcome
    puts ".___  ___.      ___      .______     ____    ____  _______  __           ______      __    __   _______ .______     ____    ____    "
    puts "|   \\/   |     /   \\     |   _  \\    \\   \\  /   / |   ____||  |         /  __  \\    |  |  |  | |   ____||   _  \\    \\   \\  /   /    "
    puts "|  \\  /  |    /  ^  \\    |  |_)  |    \\   \\/   /  |  |__   |  |        |  |  |  |   |  |  |  | |  |__   |  |_)  |    \\   \\/   /     "
    puts "|  |\\/|  |   /  /_\\  \\   |      /      \\      /   |   __|  |  |        |  |  |  |   |  |  |  | |   __|  |      /      \\_    _/      "
    puts "|  |  |  |  /  _____  \\  |  |\\  \\----.  \\    /    |  |____ |  `----.   |  `--'  '--.|  `--'  | |  |____ |  |\\  \\----.   |  |        "
    puts "|__|  |__| /__/     \\__\\ | _| `._____|   \\__/     |_______||_______|    \\_____\\_____\\\\______/  |_______|| _| `._____|   |__|        "
    puts ""
    puts "  _______  _______ .__   __.  _______ .______           ___   .___________.  ______   .______                                       "
    puts " /  _____||   ____||  \\ |  | |   ____||   _  \\         /   \\  |           | /  __  \\  |   _  \\                                      "
    puts "|  |  __  |  |__   |   \\|  | |  |__   |  |_)  |       /  ^  \\ `---|  |----`|  |  |  | |  |_)  |                                     "
    puts "|  | |_ | |   __|  |  . `  | |   __|  |      /       /  /_\\  \\    |  |     |  |  |  | |      /                                      "
    puts "|  |__| | |  |____ |  |\\   | |  |____ |  |\\  \\----. /  _____  \\   |  |     |  `--'  | |  |\\  \\----.                                 "
    puts " \\______| |_______||__| \\__| |_______|| _| `._____|/__/     \\__\\  |__|      \\______/  | _| `._____|                                 "
    puts "                                                                                                                                    "

    puts "Welcome to the Marvel Query Generator!"
    puts "What is your username? It's case sensitive!"
    print "Username:"
    @username = gets.chomp
    while User.find_user(username) != true

      puts "-----> You're not in our database. Check the usernames below and try again. Remember: usernames are case sensitive!"
      puts User.find_all_users
      puts "---------------------------------"
      print "Username:"
      @username = gets.chomp
    end
    self.menu
    #gets.chomp.downcase
  end

  def menu
    puts "-----> What would you like to do?"
    puts "0. exit"
    puts "1. See info about my saved characters"
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
      puts "Please enter a valid number!"
      self.menu
    end
  end



  def browse_my_characters
    puts "-----> What would you like to do?"
    puts "0. exit"
    puts "1. See a list of my saved characters"
    puts "2. See the top 5 most prolific characters I have saved"
    puts "3. See the top 5 of my saved characters that have appeared in the most events"
    puts "4. See the top 5 of my saved characters that have appeared in the most series"
    puts "5. Learn more about one of your characters"
    puts "6. Go back to the main menu"
    answer = gets.chomp.downcase

    if answer == "1"
      User.find_characters_by_username(username)
      self.browse_my_characters
    elsif answer == "2"
      User.find_most_prolific_characters(username)
      self.browse_my_characters
    elsif  answer == "3"
      User.find_characters_in_most_events(username)
      self.browse_my_characters
    elsif answer == "4"
      User.find_characters_in_most_series(username)
      self.browse_my_characters
    elsif answer == "5"
      self.choose_character
    elsif answer == "6"
      self.menu
    elsif  answer == "0"
      puts "Goodbye!"
      nil
    else
      puts "Please enter a valid number"
      self.browse_my_characters
    end
  end

  def choose_character

    puts "Which one do you want to learn more about?"
    print "Character Name:"
    @character_name = gets.chomp
    while Character.find_character(character_name) != true

      puts "-----> That character isn't in our database. Check the characters below and try again."
      User.find_characters_by_username(username)
      print "Character Name:"
      @character_name = gets.chomp
    end
    puts "Menu forthcoming"
  end

  def learn_about_character(character_name)
  end 


  def browse_all_characters
    puts "-----> What would you like to do?"
    puts "0. exit"
    puts "1. See a list of all characters"
    puts "2. See the top 5 most prolific characters"
    puts "3. See the top 5 characters that have appeared in the most events"
    puts "4. See the top 5 characters that have appeared in the most series"
    puts "5. Go back to the main menu"
    answer = gets.chomp.downcase

    if answer == "1"
      Character.find_all_characters
      self.browse_all_characters
    elsif  answer == "2"
      Character.find_most_prolific_characters
      self.browse_all_characters
    elsif answer == "3"
      Character.find_characters_in_most_events
      self.browse_all_characters
    elsif answer == "4"
      Character.find_characters_in_most_series
      self.browse_all_characters
    elsif answer == "5"
      self.menu
    elsif answer == "0"
     puts "Goodbye!"
     nil
    else
      puts "Please enter a valid number"
      return self.browse_all_characters
    end
  end


end
