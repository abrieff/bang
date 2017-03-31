class Card < ActiveRecord::Base

  belongs_to :card_type
  belongs_to :game
	enum location: [:deck, :hand, :equipped, :discard]
end
