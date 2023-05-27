class CreatePhoneNumberFormats < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_number_formats do |t|
      t.string :format
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
