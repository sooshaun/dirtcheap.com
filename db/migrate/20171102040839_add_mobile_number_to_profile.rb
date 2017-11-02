class AddMobileNumberToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :mobile_number, :string
  end
end
