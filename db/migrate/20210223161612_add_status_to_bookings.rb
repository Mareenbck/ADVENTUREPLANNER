class AddStatusToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :user_status, :string
  end
end
