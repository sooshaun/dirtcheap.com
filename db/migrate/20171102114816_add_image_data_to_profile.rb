class AddImageDataToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :image_data, :text
  end
end
