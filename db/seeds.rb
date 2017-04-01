# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies', 'Movie.create(['{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
game = Game.create(name: "Sample Game")

(1..7).each do |i|
	User.create(first_name: "User #{i}", last_name: "Brieff", email: "abrieff#{i}@gmail.com", nickname: "KevinSucks#{i}")
end

CSV.foreach("lib/assets/characters.csv", {headers: true, col_sep: '|'}) do |row|
	Character.create(name: row[0], description: row[1], health: row[2], modifier_type: row[3])
end

CSV.foreach("lib/assets/card_types.csv", {headers: true, col_sep: '|'}) do |row|
 	CardType.create(type: row[0], name: row[1], description: row[2], num_per_deck: row[3])
end

roles = ['Sheriff', 'Deputy', 'Deputy', 'Outlaw', 'Outlaw', 'Outlaw', 'Renegade']

roles.each do |role|
	Role.create(type: role)
end
users = User.all.to_a
(0..6).each do |i|
	# puts users[i].id
	# puts game.id
	Player.create(user: users[i], game: game)
end

deck = CardDeck.new(game)
role_deck = RoleDeck.new(game)
character_deck = CharacterDeck.new(game)

deck.initialize_cards
deck.shuffle
role_deck.assign
character_deck.assign
deck.deal
