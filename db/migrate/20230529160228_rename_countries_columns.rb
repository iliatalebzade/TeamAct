class RenameCountriesColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :countries, :alpha2_code, :iso2
    rename_column :countries, :alpha3_code, :iso3
  end
end
