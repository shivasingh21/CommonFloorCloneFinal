class AddSoldRentedPropertyToColumnToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :property_sold_rented_to, :string, default: "None"
  end
end
