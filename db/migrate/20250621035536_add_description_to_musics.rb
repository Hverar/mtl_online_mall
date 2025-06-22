class AddDescriptionToMusics < ActiveRecord::Migration[7.1]
  def change
    add_column :musics, :description, :text
  end
end
