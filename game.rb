require './item'
class Game < Item
  def initialize(author, publish_date, multiplayer, last_played_at)
    super(author, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
  def to_hash
    { id: @id, publish_date: @publish_date, author: @author.to_hash, multiplayer: @multiplayer, last_played_at: @last_played_at }
  end
  private
  def can_be_archived?
    last_played_over_2_years = Date.today.year - @publish_date.year > 2
    super && last_played_over_2_years
  end
end
