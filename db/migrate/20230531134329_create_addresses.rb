class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.text :description
      t.float :latitude
      t.float :longitude
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
