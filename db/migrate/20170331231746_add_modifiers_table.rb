class AddModifiersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :modifiers do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :parentable_id
      t.string :parentable_type
      t.string :name
      t.string :description
    end
  end
end
