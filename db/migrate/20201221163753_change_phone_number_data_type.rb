class ChangePhoneNumberDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :properties, :phone_number, :string

  end
end
