require_relative 'item'

class Author < Item
  attr_accessor :id, :items, :first_name, :last_name

  def initialize(first_name, last_name)
    super()
    @first_name = first_name
    @last_name = last_name
    @id = Random.rand(1..100)
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
