class AddReferencesColumns < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role, null: false, index: true, foreign_key: true
    add_reference :categories, :parent_category, index: true, foreign_key: { to_table: :categories, dependent: :destroy }
    add_reference :teams, :category, null: false, index: true, foreign_key: true
    add_reference :members, :user, null: false, index: true, foreign_key: { to_table: :users, dependent: :destroy }
    add_reference :members, :team, null: false, index: true, foreign_key: { to_table: :teams, dependent: :destroy }
    add_reference :members, :team_role, null: false, index: true, foreign_key: { to_table: :roles }
    add_reference :roles, :team, null: true, index: true, foreign_key: { to_table: :teams, dependent: :destroy }
  end
end
