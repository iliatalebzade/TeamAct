class ChangeCountryCoulumns < ActiveRecord::Migration[7.0]
  def change
    change_column :countries, :name, :string, null: false
    change_column :countries, :alpha3_code, :string, null: false
    change_column :countries, :phone_code, :string, null: false
    change_column :countries, :region, :string, null: false
    change_column :countries, :latitude, :float, null: false
    change_column :countries, :longitude, :float, null: false
  end
end
