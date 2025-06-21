class AddGenreToArtists < ActiveRecord::Migration[7.1]
  def change
    add_column :artists, :genre, :string
  end
end
