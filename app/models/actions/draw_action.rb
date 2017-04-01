# Action Types:
# 1. draw_action (deck, discard, barile, dynomite, panic, general store)
# 2. Play action (self, other, all, other card)
# 3. Equip action (self, other)
# 4.

class DrawAction < Action
  def deck_draw
    player.cards_per_draw.times do |i|
      Deck.new(game).draw(player)
    end
end

#Phase 1 of turn - options
#1. Draw two cards
#2. Draw two cards, pick one, draw two cards, pick one.
#3. Draw 3 cards
#4.

#Need ability to pick from arbitrary number of cards per draw, discard others
#Need ability to do this as many times as I want

