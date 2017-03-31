class AddSecondaryCharacterToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :secondary_character_id,  :integer
    add_foreign_key :players, :characters, column: :secondary_character_id
  end
end
