require './genre'
require './label'
require 'date'

class Item
  attr_reader :archived, :label, :genre, :author, :source, :id, :publish_date

  def initialize(category, publish_date)
    @id = Random.rand(1...1000)
    @publish_date = Date.parse(publish_date)
    @label = nil
    case category
    when Genre
      @genre = category
      category.add_item(self)
    # when Author
    #   @author = category

    when Label
      @label = category
    end

    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def add_label(label)
    @label = label
  end

  def can_be_archived?
    Date.today.year - @publish_date.year > 10
  end
end
