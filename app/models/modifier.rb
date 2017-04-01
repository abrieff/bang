class Modifier < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  belongs_to :parentable, polymorphic: true

  scope :from_character, -> { where(parentable_type: 'Character') }
  scope :from_card, -> { where(parentable_type: 'Card') }

  DRAW_ON_LOSS = 'DrawOnLoss'
  SECOND_DRAW_SHOW_FOR_THIRD = 'SecondDrawShowForThird'
  DRAW_ON_ATTACKED = 'DrawOnAttacked'
  FIRST_DRAW_FROM_PLAYER = 'FirstDrawFromPlayer'
  BARREL = 'Barrel'
  DRAW_TWO_ON_DRAW = 'DrawTwoOnDraw!'
  DRAW_THREE_CHOOSE_TWO = 'DrawThreeChooseTwo'
  MUSTANG = 'Mustang'
  SCOPE = 'Scope'
  FIRST_DRAW_FROM_DISCARD = 'FirstDrawFromDiscard'
  DISCARD_TWO_FOR_HEALTH = 'DiscardTwoForHealth'
  BANG_NEEDS_TWO_MISSED = 'BangNeedsTwoMissed'
  DRAW_ON_EMPTY_HAND = 'DrawOnEmptyHand'
  TAKE_DEAD_PLAYER_CARDS = 'TakeDeadPlayerCards'
  VOLCANIC = 'Volcanic'
  REMINGTON = 'Remington'
  REV_CARBINE = 'RevCarbine'
  WINCHESTER = 'Winchester'
  SCHOFIELD = 'Schofield'
  BANG_EQUALS_MISSED = 'BangEqualsMissed'
  JAIL = 'Jail'
  DYNOMITE = 'Dynomite'
end
