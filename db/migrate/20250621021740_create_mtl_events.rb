class CreateMtlEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :mtl_events do |t|
      t.string :name
      t.string :location
      t.string :age_restriction
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
