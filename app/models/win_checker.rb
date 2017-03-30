class WinChecker
	attr_accessor :game, :players

	def initialize(game)
		@game = game
	end

	def winner?
		outlaws_team_wins? || sheriffs_team_wins? || renegades_team_wins?
	end

	def winners
		if sheriffs_team_wins?
			[sheriff].merge(deputies)
		elsif outlaws_team_wins?
			outlaws
		elsif renegades_team_wins?
			renegade
		end
	end


	def players
		@players ||= game.players
	end

	def sheriffs_team_wins?
		outlaws.all? { |outlaw| outlaw.dead? } && renegade.dead?
	end

	def outlaws_team_wins?
		sheriff.dead?
	end

	def renegades_team_wins?
		outlaws.all? { |outlaw| outlaw.dead? } && deputies.all? { |deputy| deputy.dead? } && sheriff.dead?
	end

	private

	def outlaws
		@outlaws ||= players.outlaws
	end

	def renegade
		@renegade ||= players.renegade
	end

	def sheriff
		@sheriff ||= players.sheriff
	end

	def deputies
		@deputies ||= players.deputies
	end
end
