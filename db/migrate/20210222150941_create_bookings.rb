class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :begin_date
      t.date :end_date
      t.string :weather
      t.references :user, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
