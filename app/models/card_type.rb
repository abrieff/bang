class CardType < ActiveRecord::Base
  enum distance: [:self, :one, :scoped, :any, :all]

  scope :scoped, -> { where(distance: :scoped) }
  scope :self, -> { where(distance: :self) }
  scope :one, -> { where(distance: :one) }
  scope :any, -> { where(distance: :any) }
  scope :all, -> { where(distance: :all) }
end
