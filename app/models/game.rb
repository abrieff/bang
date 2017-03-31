class Game < ActiveRecord::Base
	has_many :players
	has_many :users, through: :players

  after_create :create_deck

  def create_deck
    Deck.new(self)
  end
end
