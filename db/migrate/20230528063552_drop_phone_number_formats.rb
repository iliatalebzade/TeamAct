class DropPhoneNumberFormats < ActiveRecord::Migration[7.0]
  def change
    drop_table :phone_number_formats
  end
end
