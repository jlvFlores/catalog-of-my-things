require './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(author, publish_date, multiplayer, last_played_at)
    super(author, publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def to_hash
    { publish_date: @publish_date, author: @author.to_hash, multiplayer: @multiplayer, last_played_at: @last_played_at }
  end

  private

  def can_be_archived?
    over_2_years = (Date.today - @last_played_at).to_i > (2 * 365)
    super && over_2_years
  end
end
