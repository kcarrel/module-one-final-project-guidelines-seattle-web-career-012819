class CreateCharacterCards < ActiveRecord::Migration[5.0]
  def change
    create_table :character_cards do |t|
      t.integer :user_id
      t.integer  :character_id
    end
  end
end
