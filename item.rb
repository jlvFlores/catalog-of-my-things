require './label'
require './genre'
require './author'
require 'date'

class Item
  attr_reader :id, :publish_date, :label, :genre, :author, :archived

  def initialize(category, publish_date)
    @id = Random.rand(1...1000)
    @publish_date = Date.parse(publish_date)

    case category
    when Label
      @label = category
    when Genre
      @genre = category
    when Author
      @author = category
    end
    category.add_item(self)

    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today - @publish_date).to_i > (10 * 365)
  end
end
