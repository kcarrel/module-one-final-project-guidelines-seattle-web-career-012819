#require 'pry'
#require 'rest-client'
#require 'json'
User.destroy_all
Character.destroy_all
CharacterCard.destroy_all
Event.destroy_all
EventCard.destroy_all


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
      Character.create(
        name: name,
        comics: comics_appeared_in,
        series: series_appeared_in,
        stories: stories_appeared_in,
        eventcount: events_appeared_in
      )
       if events_appeared_in != 0
         event_name = all_characters[i].to_hash["events"]["items"].to_a[0]["name"]
         Event.find_or_create_by(name:event_name)
         currentevent = Event.where(name: event_name)
         EventCard.create(event_id: currentevent[0].id, character_id: Character.all.last.id)
         i += 1
       else
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
       Character.create(
         name: name,
         comics: comics_appeared_in,
         series: series_appeared_in,
         stories: stories_appeared_in,
         eventcount: events_appeared_in
       )
        if events_appeared_in != 0
          event_name = all_characters[i].to_hash["events"]["items"].to_a[0]["name"]
          Event.find_or_create_by(name:event_name)
          currentevent = Event.where(name: event_name)
          EventCard.create(event_id: currentevent[0].id, character_id: Character.all.last.id)
          i += 1
        else
         i += 1
       end
     end


  puts "CREATING CHARACTER_CARDS"
    200.times do
      CharacterCard.create(user_id: User.all.sample.id, character_id: Character.all.sample.id)
  end
