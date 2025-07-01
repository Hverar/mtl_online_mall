class AddLatitudeAndLongitudeToMtlEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :mtl_events, :latitude, :float
    add_column :mtl_events, :longitude, :float
  end
end
