require './genre'
require './label'
require 'date'

class Item
  attr_reader :archived, :label, :genre, :author, :source, :id

  def initialize(publish_date)
    @id = Random.rand(1...1000)
    @publish_date = publish_date.nil? ? nil : Date.parse(publish_date)
    @label = nil
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
