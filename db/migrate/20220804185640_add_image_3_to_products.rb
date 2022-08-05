class AddImage3ToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :image_3, :string
  end
end
