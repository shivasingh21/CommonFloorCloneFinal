class CreatePropertyPurchaseDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :property_purchase_details do |t|
      t.references :property, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :property_bought_sold_status, default: false

      t.timestamps
    end
  end
end
