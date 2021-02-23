class RenameJsonIntoWaypointsForTrips < ActiveRecord::Migration[6.0]
  def change
    rename_column :trips, :json, :waypoints 
  end
end
