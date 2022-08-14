class RemoveStyleFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :style, :integer
  end
end
