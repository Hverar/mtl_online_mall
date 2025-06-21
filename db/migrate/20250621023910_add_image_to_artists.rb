class AddImageToArtists < ActiveRecord::Migration[7.1]
  def change
    add_column :artists, :image, :string
  end
end
