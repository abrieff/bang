class DrawLocationChecker
  PHASE_ONE_DRAW_ONE = 'ONE'
  DRAW_GENERAL_STORE = 'GENERAL_STORE'
  DRAW_ATTACKED = 'DRAW_ATTACKED'

  attr_accessor :player, :draw_number

  def initialize(player, draw_type)
    @player = player
    @draw_type = draw_type
  end

  def process
    case draw_type
    when PHASE_ONE_DRAW_ONE
      draw_one_location_checker
    when GENERAL_STORE
      draw_general_store_location_checker
    when DRAW_ATTACKED
      draw_attacked_location_checker
    else
      [{location: :deck}]
    end
  end

  def draw_one_location_checker
    [{location: :deck}] + if player.modifiers.where(name: Modifier::FIRST_DRAW_FROM_PLAYER)
      [{location: :hand}]
    elsif player.modifiers.where(name: Modifier::FIRST_DRAW_FROM_DISCARD)
      [{location: :discard}]
    end
  end

  def draw_general_store_location_checker
    [{location: :general_store}]
  end

  def draw_attacked_location_checker(attacker)
    if player.modifiers.where(name: Modifier::DRAW_ON_LOSS)
      [{location: :deck}]
    elsif player.modifiers.where(name: Modifier::DRAW_ON_ATTACKED)
      [{location: :hand, player: attacker}]
  end
end
