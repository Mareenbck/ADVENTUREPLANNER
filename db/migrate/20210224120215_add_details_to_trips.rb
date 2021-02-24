class AddDetailsToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :duration, :string
    add_column :trips, :recommended_time, :string
    add_column :trips, :subtitle, :string
  end
end
