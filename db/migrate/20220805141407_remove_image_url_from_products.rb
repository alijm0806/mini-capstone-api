class RemoveImageUrlFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :image_url1, :string
    remove_column :products, :image_url2, :string
  end
end
