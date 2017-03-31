class Card < ActiveRecord::Base

  belongs_to :card_type
  belongs_to :game
	enum location: [:deck, :hand, :equipped, :discard]

  default_scope { order(:position) }
  scope :hand, -> { where(location: :hand) }
  scope :deck, -> { where(location: :deck) }
  scope :discard, -> { where(location: :discard) }
  scope :equipped, -> { where(location: :equipped) }
  scope :unowned_cards, -> { where(location: [:deck, :discard])}
  scope :game, -> (game) { where(game: game) }

  def discard(deck)
    update(location: :discard, position: deck.next_discard_position, player_id: nil)
  end
end
