class GamesUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	belongs_to :character
	belongs_to :role
end