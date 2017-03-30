class Character < ActiveRecord::Base
	 enum ability_type: [ :phase_one, :phase_two, :reaction, :event ]
end