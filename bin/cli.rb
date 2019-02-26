require 'pry'

class CLI
  attr_accessor :username, :character_name

  def welcome
    puts <<~'welcome_text'
    .___  ___.      ___      .______     ____    ____  _______  __           ______      __    __   _______ .______     ____    ____
    |   \/   |     /   \     |   _  \    \   \  /   / |   ____||  |         /  __  \    |  |  |  | |   ____||   _  \    \   \  /   /
    |  \  /  |    /  ^  \    |  |_)  |    \   \/   /  |  |__   |  |        |  |  |  |   |  |  |  | |  |__   |  |_)  |    \   \/   /
    |  |\/|  |   /  /_\  \   |      /      \      /   |   __|  |  |        |  |  |  |   |  |  |  | |   __|  |      /      \_    _/
    |  |  |  |  /  _____  \  |  |\  \----.  \    /    |  |____ |  `----.   |  `--'  `--.|  `--'  | |  |____ |  |\  \----.   |  |
    |__|  |__| /__/     \__\ | _| `._____|   \__/     |_______||_______|    \_____\_____\\______/  |_______|| _| `._____|   |__|

      _______  _______ .__   __.  _______ .______           ___   .___________.  ______   .______
     /  _____||   ____||  \ |  | |   ____||   _  \         /   \  |           | /  __  \  |   _  \
    |  |  __  |  |__   |   \|  | |  |__   |  |_)  |       /  ^  \ `---|  |----`|  |  |  | |  |_)  |
    |  | |_ | |   __|  |  . `  | |   __|  |      /       /  /_\  \    |  |     |  |  |  | |      /
    |  |__| | |  |____ |  |\   | |  |____ |  |\  \----. /  _____  \   |  |     |  `--'  | |  |\  \----.
     \______| |_______||__| \__| |_______|| _| `._____|/__/     \__\  |__|      \______/  | _| `._____|

    Welcome to the Marvel Query Generator!
    What is your username? It's case sensitive!
    welcome_text

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
  end

  def menu
    puts <<~menu_text
    -----> What would you like to do?
    0. exit
    1. See info about my saved characters
    2. See all characters
    menu_text
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
    puts <<~browse_my_characters_text
    -----> What would you like to do?
    0. exit
    1. See a list of my saved characters
    2. See the top 5 most prolific characters I have saved
    3. See the top 5 of my saved characters that have appeared in the most events
    4. See the top 5 of my saved characters that have appeared in the most series
    5. Learn more about one of your characters
    6. Go back to the main menu
    browse_my_characters_text
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

    puts "-----> Which one do you want to learn more about? Enter '0' to return to main menu."
    print "Character Name:"
    @character_name = gets.chomp
    if character_name == "0"
      self.menu
    else
      while Character.find_character(character_name) != true

        puts "-----> That character isn't in our database. Check the characters below and try again."
        User.find_characters_by_username(username)
        print "Character Name:"
        @character_name = gets.chomp
      end
    learn_about_character(character_name)
    end
  end

  def learn_about_character(name)
    puts <<~learn_about_character_text
    -----> What would you like to do?
    0. exit
    1. See events #{name} has been involved in
    2. See general statistics about #{name}
    3. Go back to browsing your characters
    learn_about_character_text
    answer = gets.chomp
    if answer == "1"
      Character.find_events_by_character_name(name)
      self.see_all_event_characters
    elsif answer == "2"
      Character.show_statistics(name)
      self.learn_about_character(name)
    elsif answer == "0"
     puts "Goodbye!"
     nil
   elsif answer == "3"
     self.browse_my_characters
    else
      puts "Please enter a valid number"
      return self.browse_all_characters
    end
  end

  def see_all_event_characters
    puts "0. Go back to browsing your characters"
    puts "1. See all the characters in one of the above events"
    answer = gets.chomp
    if answer == "0"
      self.browse_my_characters
    elsif answer == "1"
      puts "Please enter event name!"
      print "Event Name:"
      answer = gets.chomp
      while Event.find_event(answer) != true
        puts "-----> That event isn't in our database. Check the events below and try again."
        Event.find_all_events
        print "Event Name:"
        answer = gets.chomp
      end
      Event.find_all_characters_in_event(answer)
    else puts "Please enter a valid number"
      return self.see_all_event_characters
    end
  end



  def browse_all_characters
    puts <<~browse_all_characters_text
    -----> What would you like to do?
    0. exit
    1. See a list of all characters
    2. See the top 5 most prolific characters
    3. See the top 5 characters that have appeared in the most events
    4. See the top 5 characters that have appeared in the most series
    5. Go back to the main menu
    browse_all_characters_text
    answer = gets.chomp

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
