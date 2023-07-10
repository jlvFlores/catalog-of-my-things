class Item
  attr_accessor :genre

  def initialize(genre)
    @id = id

    @genre = genre
    genre.add_item(self)
    
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    return true if @publish_date > 10

    false
  end
end
