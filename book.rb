require_relative 'item'
require './label'

class Book < Item
  attr_accessor :cover_state
  attr_reader :publisher, :publish_date, :id

  def initialize(label, publisher, cover_state, publish_date)
    super(label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def publisher=(_publisher)
    raise NoMethodError, "Cannot set 'publisher' attribute."
  end

  def to_hash
    {
      id: @id,
      label: @label.to_hash,
      publisher: @publisher,
      cover_state: @cover_state,
      publish_date: @publish_date
    }
  end

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end
end
