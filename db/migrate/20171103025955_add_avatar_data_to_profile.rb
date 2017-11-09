class AddAvatarDataToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :avatar_data, :text
  end
end
