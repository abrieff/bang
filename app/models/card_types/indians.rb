class Indians < CardType
  def self.play(giving_player, game)
    game.players.all_recipients(giving_player).each do |player|
      player.indianed
    end
  end
end
