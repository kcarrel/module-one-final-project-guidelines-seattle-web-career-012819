class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :comics
      t.integer :series
      t.integer :stories
      t.integer :events
    end
  end
end
