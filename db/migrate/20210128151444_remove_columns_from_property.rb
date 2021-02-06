class RemoveColumnsFromProperty < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :property_sold_rented_to
  end
end
