class RemoveAvatarFromProfile < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :avatar, :text
  end
end
