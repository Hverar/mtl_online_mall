class AddCategoryToBrands < ActiveRecord::Migration[7.1]
  def change
    add_column :brands, :category, :string
  end
end
