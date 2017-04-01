class AddActionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.string :type
      t.integer :card_id
      t.integer :player_id
      t.integer :recipient_id
      t.integer :game_id
      t.integer :response_from_action_id
      t.string :status
      t.timestamps
    end

    add_foreign_key :actions, :cards
    add_foreign_key :actions, :players
    add_foreign_key :actions, :players, column: :recipient_id
    add_foreign_key :actions, :games
  end
end
