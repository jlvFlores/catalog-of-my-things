require './genre'
require 'date'

class Item
  attr_reader :publish_date, :genre, :author, :label, :archived

  def initialize(category, publish_date)
    @id = Random.rand(1...1000)
    @publish_date = Date.parse(publish_date)

    case category
    when Genre
      @genre = category
      category.add_item(self)
    when Author
      @author = category
    when Label
      @label = category
    end

    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - @publish_date.year > 10
  end
end
