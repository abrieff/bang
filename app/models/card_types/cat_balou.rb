class CatBalou < CardType
  def play(giving_player, receiving_player, equipped_card, deck)
    deck.discard(equipped_card)
  end
end
