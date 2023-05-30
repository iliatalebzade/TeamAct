class AddEmojiToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :emoji, :string, null: false
  end
end
