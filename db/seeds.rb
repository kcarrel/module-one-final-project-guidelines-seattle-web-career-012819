#require 'pry'
#require 'rest-client'
#require 'json'
User.destroy_all
Character.destroy_all
CharacterCard.destroy_all


puts "CREATING USERS"
  10.times do
    User.create(
      name: Faker::Games::Zelda.character
    )
end


puts "CREATING CHARACTERS"
   i = 0
   all_characters = @client.characters(limit: 100)
    while i < 100
      name = all_characters[i].to_hash["name"]
      comics_appeared_in = all_characters[i].to_hash["comics"]["available"]
      series_appeared_in = all_characters[i].to_hash["series"]["available"]
      stories_appeared_in = all_characters[i].to_hash["stories"]["available"]
      events_appeared_in = all_characters[i].to_hash["events"]["available"]
      if events_appeared_in != 0
      puts all_characters[i].to_hash["events"]["items"].to_a[0]["name"]
      i += 1
    else
      Character.create(name: name, comics: comics_appeared_in, series: series_appeared_in, stories: stories_appeared_in, events: events_appeared_in)
      i += 1
    end
    end
    i = 0
    all_characters = @client.characters(limit: 100, offset:600)
     while i < 100
       name = all_characters[i].to_hash["name"]
       comics_appeared_in = all_characters[i].to_hash["comics"]["available"]
       series_appeared_in = all_characters[i].to_hash["series"]["available"]
       stories_appeared_in = all_characters[i].to_hash["stories"]["available"]
       events_appeared_in = all_characters[i].to_hash["events"]["available"]
       Character.create(name: name, comics: comics_appeared_in, series: series_appeared_in, stories: stories_appeared_in, events: events_appeared_in)
       i += 1
     end


  puts "CREATING CHARACTER_CARDS"
    200.times do
      CharacterCard.create(user_id: User.all.sample.id, character_id: Character.all.sample.id)
  end
