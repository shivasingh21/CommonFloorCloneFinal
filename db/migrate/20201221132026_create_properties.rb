class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :property_type
      t.string :property_status
      t.string :address
      t.string :city
      t.integer :price
      t.float :area
      t.string :owner_name
      t.string :contact_person
      t.integer :phone_number
      t.boolean :approved_status, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
