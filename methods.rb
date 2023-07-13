require 'json'

module Methods
  def list_books
    puts 'We are going to list the books here'
    @book_options.list_books
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
    @book_options.list_labels
  end

  def list_authors
    puts 'We are going to list the authors here'
  end

  def add_book
    puts 'We are going to add a book here'
    @book_options.add_book
  end

  def add_music_album
    @album_manager.add_music_album
  end

  def add_game
    puts 'We are going to add a game here'
  end

  def load_child_and_category(child_file, category_file)
    child_file_location = File.join(Dir.pwd, 'JSON_files', child_file)
    category_file_location = File.join(Dir.pwd, 'JSON_files', category_file)

    case [child_file, category_file]
    when ['albums.json', 'genres.json']
      return AlbumManager.new([], []) if File.empty?(child_file_location) || File.empty?(category_file_location)

      category_json_data = File.read(category_file_location)
      child_json_data = File.read(child_file_location)

      genres_data = JSON.parse(category_json_data)
      albums_data = JSON.parse(child_json_data)

      genres = genres_data.map { |genre| Genre.new(genre['name']) }

      music_albums = albums_data.map do |album|
        matching_genre = genres.find { |genre| genre.name == album['genre']['name'] }
        MusicAlbum.new(matching_genre, album['publish_date'], album['on_spotify'])
      end

      AlbumManager.new(music_albums, genres)

    when ['books.json', 'labels.json']
      return BookOptions.new([], []) if File.empty?(child_file_location) || File.empty?(category_file_location)

      labels_json_data = File.read(category_file_location)
      books_json_data = File.read(child_file_location)

      labels_data = JSON.parse(labels_json_data)
      books_data = JSON.parse(books_json_data)

      labels = labels_data.map { |label| Label.new(label['title'], label['color']) }

      books = books_data.map do |book|
        matching_label = labels.find { |label| label.title == book['label']['title'] }
        Book.new(matching_label, book['publisher'], book['cover_state'], book['publish_date'])
      end

      BookOptions.new(books, labels)

    else
      puts "Couldn't find either #{child_file} or #{category_file}"
      exit
    end
  end

  def save_data_to_file(data, file_name)
    file_location = File.join(Dir.pwd, 'JSON_files', file_name)
    json_data = JSON.generate(data.map(&:to_hash))
    File.write(file_location, json_data)
  end

  def load_child_and_category(child_file, category_file)
    child_file_location = File.join(Dir.pwd, 'JSON_files', child_file)
    category_file_location = File.join(Dir.pwd, 'JSON_files', category_file)

    case [child_file, category_file]
    when ['albums.json', 'genres.json']
      return AlbumManager.new([], []) if File.empty?(child_file_location) || File.empty?(category_file_location)

      category_json_data = File.read(category_file_location)
      child_json_data = File.read(child_file_location)

      genres_data = JSON.parse(category_json_data)
      albums_data = JSON.parse(child_json_data)

      genres = genres_data.map { |genre| Genre.new(genre['name']) }

      music_albums = albums_data.map do |album|
        matching_genre = genres.find { |genre| genre.name == album['genre']['name'] }
        MusicAlbum.new(matching_genre, album['publish_date'], album['on_spotify'])
      end

      AlbumManager.new(music_albums, genres)

      # when ['books.json', 'labels.json']
      # your code
      # when ['games.json', 'authors.json']
      # your code
    else
      puts "Couldn't find either #{child_file} or #{category_file}"
      exit
    end
  end

  def save_data_to_file(data, file_name)
    file_location = File.join(Dir.pwd, 'JSON_files', file_name)
    json_data = JSON.generate(data.map(&:to_hash))
    File.write(file_location, json_data)
  end

  def exit_app
    save_data_to_file(@album_manager.music_albums, 'albums.json')
    save_data_to_file(@album_manager.genres, 'genres.json')
    save_data_to_file(@book_options.book_instances, 'books.json')
    save_data_to_file(@book_options.labels, 'labels.json')
    puts 'Thank you for using our app'
    exit
  end
end
