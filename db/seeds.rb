# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies', 'Movie.create(['{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

game = Game.create(name: "Sample Game")

(1..7).each do |i|
	User.create(first_name: "User #{i}", last_name: "Brieff", email: "abrieff#{i}@gmail.com", nickname: "KevinSucks#{i}")
end

#character_types
#1. phase_1_modifier, phase_2_modifier, reaction_modifier, event_modifier
characters_array = [['Bart Cassidy', 'Each time he loses a life point, he immediately draws a card from the deck.', 4],
['Black Jack', 'Tom Ketchum (known as Black Jack) – During phase 1 of his turn, he must show the second card he draws: if it\'s a Heart or Diamond, he draws one additional card that turn (without revealing it).', 4],
['Calamity Janet', 'Calamity Jane – She can use "Bang!" cards as "Missed!" cards and vice versa. She is still subject to "Bang!" limitations: If she plays a Missed! card as a "Bang!", she cannot play another "Bang!" card that turn (unless she has a Volcanic in play).', 4],
['El Gringo', 'gringo (slang Spanish word) – Each time he loses a life point due to a card played by another player, he draws a random card from the hands of that player (one card for each life). If the player has no more cards, he does not draw.', 3],
['Jesse Jones', 'Jesse James – During phase 1 of his turn, he may choose to draw the first card from the deck, or randomly from the hand of any other player. Then he draws the second card from the deck.', 4],
['Jourdonnais', '"Frenchy" Jourdonnais, the riverboat captain in The Big Sky novel and movie (Fictional person) – He is considered to have Barrel in play at all times; he can "draw!" when he is the target of a BANG!, and on a Heart he is missed. If he has another real Barrel card in play he can count both of them, giving him two chances to cancel the BANG! before playing a Missed!', 4],
['Kit Carlson', 'Kit Carson – During the phase 1 of his turn, he looks at the top three cards of the deck: he chooses 2 to draw, and puts the other one back on the top of the deck, face down.', 4],
['Lucky Duke', 'Lucky Luke (Fictional person) – Each time he is required to "draw!", he flips the top two cards from the deck, and chooses the result he prefers. Discard both cards afterward.', 4],
['Paul Regret', 'Paul Regret – The Comancheros (film) – He is considered to have a Mustang in play at all times; all other players must add 1 to the distance to him. If he has another real Mustang in play, he can count both of them, increasing all distance to him by a total of 2.', 3],
['Pedro Ramirez', 'Tuco Ramirez – The Ugly in the film The Good, the Bad and the Ugly (Fictional person) – During phase 1 of his turn, he may choose to draw the first card from the top of the discard pile or from the deck. Then he draws the second card from the deck.', 4],
['Rose Doolan', 'She is considered to have a Scope (Appaloosa in older versions) in play at all times; she sees the other players at a distance decreased by 1. If she has another real Scope in play, she can count both of them, reducing her distance to all other players by a total of 2.', 4],
['Sid Ketchum', 'Tom Ketchum – At any time, he may discard 2 cards from his hand to regain one life point. If he is willing and able, he can use this ability more than once at a time.', 4],
['Slab the Killer', 'Angel Eyes, the Bad in the film The Good, the Bad and the Ugly (Fictional person) – Players trying to cancel his BANG! cards need to play 2 Missed!. The Barrel effect, if successfully used, only counts as one Missed!', 4],
['Suzy Lafayette', 'As soon as she has no cards in her hand, she instantly draws a card from the draw pile.', 4],
['Vulture Sam', 'Whenever a character is eliminated from the game, Sam takes all the cards that player had in his hand and in play, and adds them to his hand.', 4],
['Willy the Kid', 'Billy the Kid – He can play any number of "Bang!" cards.', 4]]

characters_array.each do |character|
	Character.create(name: character[0], description: character[1], health: character[2])
end

roles = ['Sheriff', 'Deputy', 'Deputy', 'Outlaw', 'Outlaw', 'Outlaw', 'Renegade']

roles.each do |role|
	Role.create(type: role)
end

card_types_array = [['Bang', 'Bang!', 'Shoot at someone (lose life point)'],
['Missed', 'Missed!', 'Bang! shot misses'],
['Beer', 'Beer', 'Regain 1 life point'],
['CatBalou', 'Cat Balou', 'Discard one card (in hand or play) of any player'],
['Panic', 'Panic', 'Steal a card (in hand or play) from a player at distance 1'],
['Duel', 'Duel', 'Challenged player accepts duel by playing Bang!, challenger reciprocates, first to not play a Bang! card loses one point'],
['GeneralStore', 'General Store', 'Flip over one card for each player, choose your cards'],
['Indians', 'Indians', 'All other players discard a Bang! or lose a life point'],
['Stagecoach', 'Stagecoach', 'Draw 2 cards'],
['WellsFargo', 'Wells Fargo', 'Draw 3 cards'],
['Saloon', 'Saloon', 'Everyone gets a beer (one life point)'],
['Gatling', 'Gatling', 'Shoot one shot at everyone else'],
['Jail', 'Jail', 'Player must “draw” a heart or lose first two steps of turn'],
['Barrel', 'Barrel', 'When shot at, player may “draw” a heart to dodge shot'],
['Dynamite', 'Dynamite', 'On next turn, if player “draws” a 2S-9S, dynamite explodes; if not, it is passed to next player who must “draw”; explosion costs 3 life points'],
['Mustang', 'Mustang', 'Other players see you at distance increased by 1'],
['Scope', 'Scope', 'You see other players at distance decreased by 1'],
['Schofield', 'Schofield', 'Range of 2'],
['Volcanic', 'Volcanic', 'Range of 1, multiple Bang!s per turn'],
['Remington', 'Remington', 'Range of 3'],
['RevCarabine', 'Rev Carabine', 'Range of 4'],
['Winchester', 'Winchester', 'Range of 5']]

card_types_array.each do |c_type|
	CardType.new(type: c_type[0], name: c_type[1], description: c_type[2])
end

25.times do |i|
	Card.new(card_type_id: 0, game_id: 0, position: i, location: :deck)
end

12.times do |i|
	Card.new(card_type_id: 1, game_id: 0, position: i + 25, location: :deck)
end

6.times do |i|
	Card.new(card_type_id: 2, game_id: 0, position: i + 37, location: :deck)
end

4.times do |i|
	Card.new(card_type_id: 3, game_id: 0, position: i + 43, location: :deck)
	Card.new(card_type_id: 4, game_id: 0, position: i + 47, location: :deck)
end

3.times do |i|
	Card.new(card_type_id: 5, game_id: 0, position: i + 51, location: :deck)
	Card.new(card_type_id: 12, game_id: 0, position: i + 63, location: :deck)
end

2.times do |i|
	Card.new(card_type_id: 6, game_id: 0, position: i + 54, location: :deck)
	Card.new(card_type_id: 13, game_id: 0, position: i + 66, location: :deck)
	Card.new(card_type_id: 15, game_id: 0, position: i + 69, location: :deck)
end

2.times do |i|
	Card.new(card_type_id: 7, game_id: 0, position: i + 56, location: :deck)
	Card.new(card_type_id: 8, game_id: 0, position: i + 58, location: :deck)
end

Card.new(card_type_id: 9, game_id: 0, position: 60, location: :deck)
Card.new(card_type_id: 10, game_id: 0, position: 61, location: :deck)
Card.new(card_type_id: 11, game_id: 0, position: 62, location: :deck)
Card.new(card_type_id: 14, game_id: 0, position: 68, location: :deck)

