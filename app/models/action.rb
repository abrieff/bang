class Action < ActiveRecord::Base
  enum status: [:pending, :complete]
end
