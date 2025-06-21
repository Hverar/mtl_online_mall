class AddImageToBrands < ActiveRecord::Migration[7.1]
  def change
    add_column :brands, :image, :string
  end
end
