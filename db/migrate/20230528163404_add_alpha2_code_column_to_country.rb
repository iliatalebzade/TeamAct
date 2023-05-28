class AddAlpha2CodeColumnToCountry < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :alpha2_code, :string, null: false
  end
end
