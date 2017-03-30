class Card < ActiveRecord::Base
	enum location: [:deck, :hand, :equipped, :discard]
end