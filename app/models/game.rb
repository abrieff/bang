class Game < ActiveRecord::Base
	has_many :games_users
	has_many :users, through: :games_users
end