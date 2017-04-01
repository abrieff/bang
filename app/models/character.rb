class Character < ActiveRecord::Base
  has_one :modifier
end


# Things that change for each character:
# 1. Getting shot.
# 2. Second card draw.
# 3. Playing Bang, Playing Missed.
# 4. Getting shot.
# 5. First card draw.
# 6. Getting shot (Barrel)
# 7. Both card draws (chooses 3)
# 8. On 'draws!', choose two instead.
# 9. Distance (mustang)
# 10. First card draw (location)
# 11. Sight (scope)
# 12. Discarding. (special)
# 13. Shooting. (Every bang requires two missed)
# # 14. Running Out of Cards (draws one)
# # 15. Player dying.
# # 16. Playing cards (unlimited volcanic)


# Phase 1 Possibilities:

# Show a card.
# Take an arbitrary number of cards.
# Draw card from any location.
# Take action based on outcome of card drawn (shown to public)
# Decide between any number of cards, discard rest.

# Phase 2 Possibilities:
# 1. Bang - Miss Switchup
# 2. Sight change
# 3. Bang - require two missed
# 4. Bang - as many as you want

#  Whenever Possibilities:
#  1. Draws! draw two.
#  2. Distance change
#  3.

#  Modifiers columns:
#  1. Num bangs per turn
#  2. Num missed per bang
#  3. Distance
#  4. Sight
#  5. get dead cards
#  6. get card if run out
#  7. discard two for health
#  8. barile
#  9.
#  1. volcanic
#  2. Each gun.
#  3. Scope + 1


