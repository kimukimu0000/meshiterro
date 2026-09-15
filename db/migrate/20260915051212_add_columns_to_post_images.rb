class AddColumnsToPostImages < ActiveRecord::Migration[8.0]
  def change
    add_column :post_images, :shop_name, :string
    add_column :post_images, :caption, :text
    add_column :post_images, :user_id, :integer
  end
end
