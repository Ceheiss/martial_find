class AddCategoryIdToGyms < ActiveRecord::Migration[5.1]
  def change
    add_column :gyms, :category_id, :integer
  end
end
