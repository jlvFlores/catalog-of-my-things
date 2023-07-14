require 'json'

module Methods
  def list_books
    @book_options.list_books
  end

  def list_music_albums
    @album_manager.list_music_albums
  end

  def list_games
    @game_manager.list_games
  end

  def list_genres
    @album_manager.list_genres
  end

  def list_labels
    @book_options.list_labels
  end

  def list_authors
    @game_manager.list_authors
  end

  def add_book
    @book_options.add_book
  end

  def add_music_album
    @album_manager.add_music_album
  end

  def add_game
    @game_manager.add_game
  end

  def empty_file?(file_location)
    File.size?(file_location).nil?
  end

  def parse_data(file)
    json_data = File.read(file)
    JSON.parse(json_data)
  end

  def load_child_and_category(child_file, category_file)
    child_file_location = File.join(Dir.pwd, 'JSON_files', child_file)
    category_file_location = File.join(Dir.pwd, 'JSON_files', category_file)

    case [child_file, category_file]
    when ['albums.json', 'genres.json']
      load_album_manager(child_file_location, category_file_location)

    when ['books.json', 'labels.json']
      load_book_options(child_file_location, category_file_location)

    when ['games.json', 'authors.json']
      load_game_manager(child_file_location, category_file_location)

    else
      puts "Couldn't find either #{child_file} or #{category_file}"
      exit
    end
  end

  def load_album_manager(album_file_location, genre_file_location)
    return AlbumManager.new([], []) if empty_file?(album_file_location) || empty_file?(genre_file_location)

    genre_json_data = File.read(genre_file_location)
    album_json_data = File.read(album_file_location)

    genres_data = JSON.parse(genre_json_data)
    albums_data = JSON.parse(album_json_data)

    genres = genres_data.map { |genre| Genre.new(genre['name']) }

    music_albums = albums_data.map do |album|
      matching_genre = genres.find { |genre| genre.name == album['genre']['name'] }
      MusicAlbum.new(matching_genre, album['publish_date'], album['on_spotify'])
    end

    AlbumManager.new(music_albums, genres)
  end

  def load_book_options(book_file_location, label_file_location)
    return BookOptions.new([], []) if empty_file?(book_file_location) || empty_file?(label_file_location)

    label_json_data = File.read(label_file_location)
    book_json_data = File.read(book_file_location)

    labels_data = JSON.parse(label_json_data)
    books_data = JSON.parse(book_json_data)

    labels = labels_data.map { |label| Label.new(label['title'], label['color']) }

    books = books_data.map do |book|
      matching_label = labels.find { |label| label.title == book['label']['title'] }
      Book.new(matching_label, book['publisher'], book['cover_state'], book['publish_date'])
    end

    BookOptions.new(books, labels)
  end

  def load_game_manager(game_file_location, author_file_location)
    return GameManager.new([], []) if empty_file?(game_file_location) || empty_file?(author_file_location)

    games_data = parse_data(game_file_location)
    authors_data = parse_data(author_file_location)

    authors = authors_data.map { |author| Author.new(author['first_name'], author['last_name']) }

    games = games_data.map do |game|
      matching_author = authors.find { |author| author.first_name == game['author']['first_name'] && author.last_name == game['author']['last_name'] }
      Game.new(matching_author, game['publish_date'], game['multiplayer'], game['last_played_at'])
    end

    GameManager.new(games, authors)
  end

  def save_data_to_file(data, file_name)
    file_location = File.join(Dir.pwd, 'JSON_files', file_name)
    json_data = JSON.generate(data.map(&:to_hash))
    File.write(file_location, json_data)
  end

  def exit_app
    save_data_to_file(@book_options.book_instances, 'books.json')
    save_data_to_file(@book_options.labels, 'labels.json')
    save_data_to_file(@album_manager.music_albums, 'albums.json')
    save_data_to_file(@album_manager.genres, 'genres.json')
    save_data_to_file(@game_manager.games, 'games.json')
    save_data_to_file(@game_manager.authors, 'authors.json')
    puts 'Thank you for using our app'
    exit
  end
end
