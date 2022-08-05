class ChangeImageToUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :image_1, :image_url1
    rename_column :products, :image_3, :image_url2
  end
end
