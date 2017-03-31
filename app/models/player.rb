class Player < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	belongs_to :character
	belongs_to :role

	scope :sheriff, -> { joins(:roles).where(roles: {type: 'Sheriff'}).first }
	scope :deputies, -> { joins(:roles).where(roles: {type: 'Deputy'}) }
	scope :outlaws, -> { joins(:roles).where(roles: {type: 'Outlaw'}) }
	scope :renegade, -> { joins(:roles).where(roles: {type: 'Renegade'}).first }
end
