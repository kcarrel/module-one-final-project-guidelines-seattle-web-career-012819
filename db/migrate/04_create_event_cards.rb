class CreateEventCards < ActiveRecord::Migration[5.0]
  def change
    create_table :event_cards do |t|
      t.integer :event_id
      t.integer  :character_id
    end
  end
end
