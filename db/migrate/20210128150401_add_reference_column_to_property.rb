class AddReferenceColumnToProperty < ActiveRecord::Migration[5.2]
  def change
    add_reference :properties, :sold_or_rent_to_user, foreign_key: { to_table: :users }, default: nil
  end
end
