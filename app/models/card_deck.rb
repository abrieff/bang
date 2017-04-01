class CardDeck
  attr_accessor :game, :cards

  def initialize(game)
    @game = game
  end

  def initialize_cards
    CardType.all.each do |card_type|
      card_type.num_per_deck.times do |i|
        Card.find_or_create_by(card_type: card_type, game: game)
      end
    end
  end

  def shuffle
    positions = (0..unowned_cards.length - 1).to_a.shuffle
    unowned_cards.each_with_index do |card, index|
      card.position = positions[index]
      card.save
    end
  end

  def deal
    2.times do |i|
      players.each do |player|
        draw(player)
      end
    end
  end

  def draw(player)
    player.draw(deck_cards.first)
  end

  def discard(card)
    update(location: :discard, position: next_position(:discard), player_id: nil)
  end

  private

  def next_position(location)
    (cards.where(location: location).maximum(:position) || -1) + 1
  end

  def unowned_cards
    Card.game(game).unowned_cards
  end

  def deck_cards
    Card.game(game).deck
  end

  def discard_cards
    Card.game(game).discard
  end

  def cards
    Card.game(game)
  end

  def players
    @players ||= game.players
  end
end
