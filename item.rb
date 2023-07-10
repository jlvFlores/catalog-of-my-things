class Item
  attr_accessor :archived

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1...1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today - @publish_date).to_i > ( 10 * 365)
  end
end
