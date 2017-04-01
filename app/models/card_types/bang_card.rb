class BangCard < CardType
  def self.play(giving_player, receiving_player)
    return unless giving_player.can_see(receiving_player)
    receiving_player.banged
  end
end
