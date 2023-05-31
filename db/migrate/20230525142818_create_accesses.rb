class CreateAccesses < ActiveRecord::Migration[7.0]
  def change
    create_table :accesses do |t|
      t.string :route, null: false

      t.timestamps
    end
  end
end
