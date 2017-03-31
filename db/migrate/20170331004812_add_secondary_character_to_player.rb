class AddSecondaryCharacterToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :integer,  :secondary_character_id
    add_foreign_key :players, :characters, column: :secondary_character_id
  end
end
