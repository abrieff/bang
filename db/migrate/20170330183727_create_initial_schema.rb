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

    create_table :games_users do |t|
    	t.integer :user_id, null: false
    	t.integer :game_id, null: false
    	t.integer :character_id
    	t.integer :role_id
    	t.integer :health, default: 4
	end

	create_table :roles do |t|
		t.string :type, null: false, default: 'Outlaw'
		t.text :description
	end

	create_table :characters do |t|
		t.string :name, null: false
		t.text :description
		t.integer :ability_type
		t.integer :health, null: false, default: 4
	end

	create_table :card_types do |t|
		t.string :type, null: false
		t.string :name, null: false
		t.text :description
		t.string :image_filename
	end

	create_table :cards do |t|
		t.integer :game_id, null: false
		t.integer :location, default: 'deck', null: false
		t.integer :games_user_id
		t.integer :position
		t.integer :card_type_id, null: false
	end

 	add_foreign_key :game_users, :games
 	add_foreign_key :game_users, :users
 	add_foreign_key :game_users, :roles
 	add_foreign_key :game_users, :characters
 	add_foreign_key :characters, :abilities
  end
end
