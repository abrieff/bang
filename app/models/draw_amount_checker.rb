class DrawAmountChecker
  PHASE_ONE_DRAW_ONE = 'ONE'
  PHASE_ONE_DRAW_TWO = 'TWO'
  RESPONSE_DRAW = 'DRAW!'
  def initialize(player, draw_type)
    @player = player
    @draw_type = draw_type
  end

  def process
    case draw_type
    when PHASE_ONE_DRAW_ONE
      draw_one_amount_checker
    when PHASE_ONE_DRAW_TWO
      draw_two_amount_checker
    when RESPONSE_DRAW
      response_draw_amount_checker
    else
      return_options
    end
  end

  def draw_one_amount_checker
    if player.modifiers.where(name: Modifier::DRAW_THREE_CHOOSE_TWO)
      return_options(amount: 3, choose: 2)
    else
      return_options
    end
  end

  def draw_two_amount_checker
    if player.modifiers.where(name: Modifier::SECOND_DRAW_SHOW_FOR_THIRD)
      return_options(show: true)
    elsif player.modifers.where(name: Modifier::DRAW_THREE_CHOOSE_TWO)
      return_options(amount: 0, choose: 0)
    else
      return_options
    end
  end

  def response_draw_amount_checker
    if player.modifiers.where(name: Modifier::DRAW_TWO_ON_DRAW)
      return_options(amount: 2, choose: 1)
    else
      return_options
    end
  end

  private

  def return_options(show: false, amount: 1, choose: 1)
    {show: show, amount: amount, choose: choose}
  end
end
