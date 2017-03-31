class Deck
  def initialize(game)
    @game = game
    CardType.all.each do |card_type|
      card_type.num_per_deck.times do |i|
        Card.create(card_type: card_type, game: game)
      end
    end
  end

  def shuffle
    positions = (0..cards.length - 1).shuffle
    cards.each_with_index do |card, index|
      card.position = positions[index]
      card.save
    end
  end

  private

  def cards_array
    @cards ||= Card.where(game: game, location: [:deck, :discard]).to_a
  end
end
