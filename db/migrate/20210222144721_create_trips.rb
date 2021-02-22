class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.float :start_lat
      t.float :start_long
      t.float :end_lat
      t.float :end_long
      t.float :kilometers
      t.integer :difficulty
      t.text :description
      t.string :equipments
      t.float :positive_elevation
      t.float :negative_elevation

      t.timestamps
    end
  end
end
