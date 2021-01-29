class RemoveColumnFronPropertyPurchaeDetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :property_purchase_details, :property_bought_sold_status
  end
end
