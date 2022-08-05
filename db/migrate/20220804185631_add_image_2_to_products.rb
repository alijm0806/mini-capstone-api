class AddImage2ToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :image_2, :string
  end
end
