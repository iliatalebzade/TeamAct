class RemovePhoneNumberFormatIdFromPhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :phone_numbers, :phone_number_format
  end
end
