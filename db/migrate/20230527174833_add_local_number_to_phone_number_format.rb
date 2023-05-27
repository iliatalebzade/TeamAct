class AddLocalNumberToPhoneNumberFormat < ActiveRecord::Migration[7.0]
  def change
    add_column :phone_number_formats, :local_number, :string
  end
end
