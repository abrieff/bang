class RoleDeck
  attr_accessor :game, :players, :roles

  def initialize(game)
    @game = game
    @players = game.players
  end

  def assign
    players.each_with_index do |player, index|
      player.role = roles[index]
      player.save
    end
  end

  def roles
    @roles = if players.count == 4
      four_roles
    elsif players.count == 5
      five_roles
    elsif players.count == 6
      six_roles
    elsif players.count == 7
      seven_roles
    end
  end

  private

  def four_roles
    [Sheriff.first, Outlaw.take(2), Renegade.first].flatten.shuffle
  end

  def five_roles
    [Sheriff.first, Outlaw.take(2), Deputy.first, Renegade.first].flatten.shuffle
  end

  def six_roles
    [Sheriff.first, Outlaw.take(3), Deputy.first, Renegade.first].flatten.shuffle
  end

  def seven_roles
    [Sheriff.first, Outlaw.take(3), Deputy.take(2), Renegade.first].flatten.shuffle
  end
end
