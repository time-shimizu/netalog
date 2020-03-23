class AddSubcategoryIdToMicropost < ActiveRecord::Migration[5.2]
  def change
    add_reference :microposts, :subcategory, foreign_key: true
  end
end
