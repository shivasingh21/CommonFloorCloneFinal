class AddDatabaseLevelConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column(:users, :username, :string, null: false, unique: true)
    change_column(:users, :email, :string, null: false, unique: true)

    change_column(:categories, :name, :string, null: false, unique: true)

    change_column_null(:properties, :property_type, false)
    change_column_null(:properties, :property_status, false)
    change_column_null(:properties, :address, false)
    change_column_null(:properties, :city, false)
    change_column_null(:properties, :price, false)
    change_column_null(:properties, :area, false)
    change_column_null(:properties, :owner_name, false)
    change_column_null(:properties, :contact_person, false)
    change_column_null(:properties, :phone_number, false)

    change_column_null(:comments, :rating, false)
    change_column_null(:comments, :comment, false)

  end
end
