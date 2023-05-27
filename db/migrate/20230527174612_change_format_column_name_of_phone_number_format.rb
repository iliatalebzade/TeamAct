class ChangeFormatColumnNameOfPhoneNumberFormat < ActiveRecord::Migration[7.0]
  def change
    rename_column :phone_number_formats, :format, :area_code
  end
end
