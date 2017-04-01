class Gatling < CardType
  def self.play(giving_player, game)
    game.players.all_recipients(giving_player)..each do |player|
      player.banged
    end
  end
end
