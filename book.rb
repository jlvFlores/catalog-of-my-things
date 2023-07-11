require_relative 'item'

class Book < Item
  attr_reader :cover_state, :publisher

  def initialize(publisher, cover_state, publish_date)
    super('fantasy', 'John Doe', 'Bookstore', 'ABC Publishing', publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end
end