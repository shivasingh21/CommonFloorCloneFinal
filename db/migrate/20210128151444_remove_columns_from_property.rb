class RemoveColumnsFromProperty < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :property_sold_rented_to
    remove_column :properties, :sold_or_rent_to_user_id
  end
end
