class Card < ActiveRecord::Base

  belongs_to :card_type
  belongs_to :game
  belongs_to :player
  has_one :modifier
	enum location: [:deck, :hand, :equipped, :discard, :decision]

  default_scope { order(:position) }
  scope :hand, -> { where(location: :hand) }
  scope :deck, -> { where(location: :deck) }
  scope :decision, -> { where(location: :decision) }
  scope :discard, -> { where(location: :discard) }
  scope :equipped, -> { where(location: :equipped) }
  scope :unowned_cards, -> { where(location: [:deck, :discard])}
  scope :game, -> (game) { where(game: game) }

  def discard
    update(location: :discard, position: deck.next_position(:discard), player_id: nil)
    modifier.destroy
  end

  def equip
    return unless player.present?
    update(location: :equipped, position: player.next_position(:equipped))
    Modifier.create(game: game, player: player, name: card_type.type, description: card_type.description, parentable: self)
  end

  def draw(player)
     update(location: :decision, position: player.next_position(:decision), player_id: player.id)
  end

  def deck
    @deck ||= CardDeck.new(game)
  end

end
