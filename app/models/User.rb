class User < ActiveRecord::Base
  has_many :character_cards# :tracked_characters
  has_many :characters, through: :character_cards

  def self.find_user(name)
    self.exists?(name: name)
  end

  def self.find_all_users
    puts self.pluck(:name)
  end

   def find_characters
     rows = self.characters.map { |character| ["#{character.name}"] }
     table = Terminal::Table.new :headings => ['Characters'],:rows => rows
     puts table
   end

   def find_most_prolific_characters
     top_characters = self.characters.order(comics: :desc).limit(5)
     rows = top_characters.map { |character| ["#{character.name}", character.comics] }
     table = Terminal::Table.new ({
        :headings => ['Character', 'Number of Comics Appeared In'],
        :rows => rows
      })
     puts table
   end

   def find_characters_in_most_events
     top_characters = self.characters.order(eventcount: :desc).limit(5)
     rows = top_characters.map { |character| ["#{character.name}", character.eventcount] }
     table = Terminal::Table.new ({
       :headings => ['Character', 'Number of Events Appeared In'],
       :rows => rows
     })
     puts table
  end

   def find_characters_in_most_series
     top_characters = self.characters.order(series: :desc).limit(5)
     rows = top_characters.map { |character| ["#{character.name}", character.series] }
     table = Terminal::Table.new ({
       :headings => ['Character', 'Number of Series Appeared In'],
       :rows => rows
     })
     puts table
  end

end
