#PhaseOneManager
#handles process of dynomite, jail, and drawing cards.
#PhaseTwoManager
#handles process of playing and equipping cards.
#ResponseManager
#Handles process of responding to attack.
#DeathManager
#Handles process of dying.
#


#Turns: belong to game
#Actions: belong to game, player, turn
#PhaseOneManager - order of steps:
# 1. If Dynomite Equipped, draw for dynomite. pass to next or explode.
# 2. If Jail equipped, draw for jail. skip rest or continue.
# 3. If no previous draws, draw one. if previous draw, draw two. etc.
# If drawn twice, phase two manager.

#PhaseTwoManager:
# 1. Can end turn if less cards than character health
# 2. Can equip as many cards as you want.
# 3. Can play cards against other people. If pending attack, can't move.
# 4. Can play cards against self.

#ResponseManager:
# 1. Can draw for barile if shot and have barile.
# 2. Can play (any number of) missed if shot and have missed.
# 3. Can play beer if killed and have beer.
# 4. Can take hit.
# 5. Can draw card if has power.
# 6. Can play bang if in duel or shot by indians.

#DeathManager:
# 1. If vulture, take all dead players cards.
# 2. If sheriff, and dead player is deputy, discard all cards.
# 3. If dead player is outlaw, and killer, draw 3 cards.

Done! #AttackOptionsChecker
# 1. Take in card, player, return list of players it can be used against.


