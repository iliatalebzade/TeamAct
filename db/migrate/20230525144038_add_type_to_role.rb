class AddTypeToRole < ActiveRecord::Migration[7.0]
  def change
    add_column :roles, :type, :string, null: false
  end
end
