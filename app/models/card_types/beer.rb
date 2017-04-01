class Beer < CardType
  def play(giving_player)
    giving_player.increase_health
  end
end
