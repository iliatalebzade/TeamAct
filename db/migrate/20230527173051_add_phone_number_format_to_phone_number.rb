class AddPhoneNumberFormatToPhoneNumber < ActiveRecord::Migration[7.0]
  def change
    add_reference :phone_numbers, :phone_number_format, null: false, foreign_key: { dependent: :destroy }
  end
end
