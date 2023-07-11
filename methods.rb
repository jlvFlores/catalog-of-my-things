module Methods
  def list_books
    puts 'We are going to list the books here'
  end

  def list_music_albums
    @album_manager.list_music_albums
  end

  def list_games
    puts 'We are going to list the games here'
  end

  def list_genres
    @album_manager.list_genres
  end

  def list_labels
    puts 'We are going to list the labels here'
  end

  def list_authors
    puts 'We are going to list the authors here'
  end

  def add_book
    puts 'We are going to add an book here'
  end

  def add_music_album
    @album_manager.add_music_album
  end

  def add_game
    puts 'We are going to add an game here'
  end

  def exit_app
    puts 'Thank you for using our app'
    exit
  end
end
