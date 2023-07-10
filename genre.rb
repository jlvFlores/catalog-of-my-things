class Genre
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    items = []
  end

  add_item(item)
    @items << item
  end
end
