class RemoveImageDataFromProfile < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :image_data, :text
  end
end
