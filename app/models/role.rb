class Role < ActiveRecord::Base

  def dead?
    health == 0
  end
end
