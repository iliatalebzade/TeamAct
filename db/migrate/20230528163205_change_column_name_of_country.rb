class ChangeColumnNameOfCountry < ActiveRecord::Migration[7.0]
  def change
    rename_column :countries, :code, :alpha3_code
  end
end
