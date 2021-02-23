class TurnEquipmentsIntoArrayForTrips < ActiveRecord::Migration[6.0]
  def change
    remove_column :trips, :equipments, :string
    add_column :trips, :equipments, :string, array: true, default: []
  end
end
