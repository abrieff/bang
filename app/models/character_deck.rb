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
      player.secondary_character = characters[character_index + 1]
      player.save
      character_index += 2
    end
  end

  def characters
    @characters ||= Character.all.to_a.shuffle
  end
end
