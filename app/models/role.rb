class Role < ActiveRecord::Base

	def players(game)
		game.games_users.includes(:roles).find_by(roles: { type: type })
	end
end