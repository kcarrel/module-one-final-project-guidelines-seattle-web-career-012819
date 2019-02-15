class Event < ActiveRecord::Base
  has_many :event_cards
  has_many :characters, through: :event_cards
end
