class AddJsonToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :json, :json
  end
end
