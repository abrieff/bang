class CardDeck
  attr_accessor :game, :cards

  def initialize(game)
    @game = game
    CardType.all.each do |card_type|
      card_type.num_per_deck.times do |i|
        Card.find_or_create_by(card_type: card_type, game: game)
      end
    end
  end

  def shuffle
    positions = (0..cards.length - 1).to_a.shuffle
    cards.each_with_index do |card, index|
      card.position = positions[index]
      card.save
    end
  end

  def cards
    @cards ||= Card.where(game: game, location: [:deck, :discard])
  end
end
