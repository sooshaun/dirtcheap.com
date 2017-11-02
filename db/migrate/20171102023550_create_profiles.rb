class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :bsb
      t.string :account_number
      t.boolean :privacy
      t.text :avatar
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
