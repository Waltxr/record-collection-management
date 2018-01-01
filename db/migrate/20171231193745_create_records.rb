class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.integer :artist_id
      t.string :title
      t.string :genre
      t.date :release_date
      t.timestamps
    end
  end
end
