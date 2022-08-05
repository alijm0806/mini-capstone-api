class ChangeImageToImage1 < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :image, :image_1
  end
end
