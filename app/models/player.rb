class Player < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	belongs_to :character
	belongs_to :role
  has_many :cards

	scope :sheriff, -> { joins(:roles).where(roles: {type: 'Sheriff'}).first }
	scope :deputies, -> { joins(:roles).where(roles: {type: 'Deputy'}) }
	scope :outlaws, -> { joins(:roles).where(roles: {type: 'Outlaw'}) }
	scope :renegade, -> { joins(:roles).where(roles: {type: 'Renegade'}).first }
  scope :live, -> { where('health > 0') }

  def dead?
    health == 0
  end

  def draw(card)
    card.update(location: :hand, position: next_hand_position, player_id: id)
  end

  def equip(card)
    card.update(location: :equipped, position: next_equipped_position)
  end

  def discard(card, deck)
    card.discard(deck)
  end

  private

  def next_hand_position
    (cards.hand.maximum(:position) || -1) + 1
  end

  def next_equipped_position
    (cards.equipped.maximum(:position) || -1) + 1
  end
end
