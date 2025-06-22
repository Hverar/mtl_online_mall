class CreateMusics < ActiveRecord::Migration[7.1]
  def change
    create_table :musics do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.string :cover_image

      t.timestamps
    end
  end
end
