require_relative 'item'

class Label
  attr_accessor :title, :color
  attr_reader :items, :id

  def initialize(title, color)
    @id = id || Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def to_hash
    {
      id: @id,
      title: @title,
      color: @color
    }
  end

  def add_item(item)
    @items << item
  end
end
