class CreateUserRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :user_records do |t|
      t.integer :user_id
      t.integer :record_id
      t.integer :rating
      t.text :notes
      t.string :purchase_location
      t.integer :value 
      t.timestamps
    end
  end
end
