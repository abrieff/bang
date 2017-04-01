class CreateInitialSchema < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :email
    	t.string :password
    	t.string :nickname
    	t.integer :total_score
    	t.timestamps
    end

    create_table :games do |t|
    	t.string :name, null: false
    end

    create_table :players do |t|
    	t.integer :user_id, null: false
    	t.integer :game_id, null: false
    	t.integer :character_id
    	t.integer :role_id
      t.integer :location, null: false
    	t.integer :health, default: 4
	end

	create_table :roles do |t|
		t.string :type, null: false, default: 'Outlaw'
		t.text :description
	end

	create_table :characters do |t|
		t.string :name, null: false
		t.text :description
		t.integer :health, null: false, default: 4
    t.string :modifier_type
	end

	create_table :card_types do |t|
		t.string :type, null: false
		t.string :name, null: false
		t.text :description
    t.integer :num_per_deck
    t.integer :distance
		t.string :image_filename
	end

	create_table :cards do |t|
		t.integer :game_id, null: false
		t.integer :location, default: 'deck', null: false
		t.integer :player_id
		t.integer :position
		t.integer :card_type_id, null: false
	end

 	add_foreign_key :players, :games
 	add_foreign_key :players, :users
 	add_foreign_key :players, :roles
 	add_foreign_key :players, :characters
 	add_foreign_key :cards, :games
 	add_foreign_key :cards, :games_users
 	add_foreign_key :cards, :card_types
  end
end
