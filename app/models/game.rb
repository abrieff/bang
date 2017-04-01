class Game < ActiveRecord::Base
	has_many :players
	has_many :users, through: :players
  has_many :cards
  after_create :create_deck

  def create_deck
    CardDeck.new(self).initialize_cards
  end
end
