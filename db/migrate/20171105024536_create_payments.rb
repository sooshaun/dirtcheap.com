class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.references :household_item, foreign_key: true
      t.string :charge_identifier

      t.timestamps
    end
  end
end
