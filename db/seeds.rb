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

  def create_characters(limit, offset)
    all_characters = @client.characters(limit: limit, offset: offset)
    all_characters.each do |character|

      # &. is the "safe navigation operator"
      # it means that the program won't crash if the API doesn't return
      # character.name, character.comics, etc. like we expect
      current_character = Character.create(
        name: character&.name,
        comics: character&.comics&.available,
        series: character&.series&.available,
        stories: character&.stories&.available,
        eventcount: character&.events&.available
      )

      character&.events&.items.each do |event|
        current_event = Event.find_or_create_by(name: event.name)
        EventCard.create(event: current_event, character: current_character)
      end
    end
  end

  create_characters(100, 0)
  create_characters(100, 600)


puts "CREATING CHARACTER_CARDS"
  200.times do
    CharacterCard.create(user: User.all.sample, character: Character.all.sample)
  end
