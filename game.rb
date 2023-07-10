require_relative 'item'
require 'date'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, archived: false)
    super(archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?()
    check_played = Time.now.year - last_played_at.year > 2
    archived && check_played
    false
  end
end
