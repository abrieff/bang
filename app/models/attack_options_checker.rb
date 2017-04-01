class AttackOptionsChecker
  def initialize(player, card)
    @player = player
    @card = card
    @game = player.game
  end

  def attackable_players
    if card.card_type == 'Jail'
      game.players.not.sheriff
    elsif card.card_type.scoped?
      visible_players_for_scope(player.scope)
    elsif card.card_type.self?
      player
    elsif card.card_type.one?
      visible_players_for_scope(1)
    elsif card.card_type.any? || card.card_type.all?
      game.players.all_recipients(player)
    end
  end

  def visible_players_for_scope(scope)
    game.players.all_recipients.select do |recipient_player|
      scope - player.distance_from(other_player) >= 0
    end
  end
end

#Bug is that if you have a mustang you cant attack yourself, but whatever
