class CharacterDeck
  attr_accessor :game, :players, :characters

  def initialize(game)
    @game = game
    @players = game.players
  end

  def assign
    character_index = 0
    players.each do |player|
      player.character = characters[character_index]
      player.secondary_character_id = characters[character_index + 1].id
      player.save
      character_index += 2
    end
  end

  def characters
    @characters ||= Character.all.to_a.shuffle
  end
end
