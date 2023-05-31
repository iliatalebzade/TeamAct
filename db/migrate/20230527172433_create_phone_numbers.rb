class CreatePhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_numbers do |t|
      t.string :number, null: false
      t.references :user, null: false, foreign_key: { dependent: :destroy }

      t.timestamps
    end
  end
end
