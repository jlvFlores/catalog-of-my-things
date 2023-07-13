require './item'

class MusicAlbum < Item
  def initialize(genre, publish_date, on_spotify)
    super(genre, publish_date)
    @on_spotify = on_spotify
  end

  def to_hash
    { id: @id, publish_date: @publish_date, genre: @genre.to_hash, on_spotify: @on_spotify }
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
