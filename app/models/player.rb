class Player < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	belongs_to :character
	belongs_to :role
  has_many :cards
  has_many :modifiers

	scope :sheriff, -> { joins(:roles).where(roles: {type: 'Sheriff'}).first }
	scope :deputies, -> { joins(:roles).where(roles: {type: 'Deputy'}) }
	scope :outlaws, -> { joins(:roles).where(roles: {type: 'Outlaw'}) }
	scope :renegade, -> { joins(:roles).where(roles: {type: 'Renegade'}).first }
  scope :live, -> { where('health > 0') }
  scope :all_recipients, -> (player) { where.not.(player_id: player.id) }

  after_save :set_character_modifier, if: :character_id_changed?

  def set_character_modifier
    modifiers.from_character.destroy_all
    modifiers.create(game: game, parentable: character, name: character.modifier_type, description: character.description)
  end

  def dead?
    health == 0
  end

  def draw(card)
    card.draw(self)
  end

  def complete_decision(card)
    card.update(location: :hand, position: next_position(:hand))
    cards.decision.each { |card| card.discard }
  end

  def equip(card)
    card.equip
  end

  def discard(card)
    card.discard
  end

  def next_position(location)
    (cards.where(location: location).maximum(:position) || -1) + 1
  end

  def scope
    modifiers.scopes.count + modifiers.from_card.guns.first.gunscope + 1
  end

  def distance
    modifiers.where(name: Modifier::MUSTANG).count + 1
  end

  def distance_from(other_player)
    forward_distance = (player.location - other_player.location).abs
    backward_distance = game.players.count - forward_distance
    [forward_distance, backward_distance].min + (other_player.distance - 1)
  end
end
