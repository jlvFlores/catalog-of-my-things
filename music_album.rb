require './item'

class MusicAlbum < Item
  def initialize(genre, on_spotify)
    super(genre)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    return super && @on_spotify
  end
end