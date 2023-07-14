require_relative 'book_options'
require_relative 'label'
require_relative 'methods'
require './album_manager'
require './game_manager'

class Main
  include Methods
  attr_accessor :items, :labels

  def initialize
    @book_options  = load_child_and_category('books.json',  'labels.json')
    @album_manager = load_child_and_category('albums.json', 'genres.json')
    @game_manager  = load_child_and_category('games.json',  'authors.json')
    interface
  end

  OPTIONS = {
    1 => 'list_books',
    2 => 'list_music_albums',
    3 => 'list_games',
    4 => 'list_genres',
    5 => 'list_labels',
    6 => 'list_authors',
    7 => 'add_book',
    8 => 'add_music_album',
    9 => 'add_game',
    10 => 'exit_app'
  }.freeze

  def interface
    show_console_options
    option = get_user_input('Enter your choice: ').to_i
    select_option(option)
    interface
  end

  def show_console_options
    puts "\nWelcome to the Ruby Console App!"
    puts "\nPlease choose an option from the list below:"
    puts '-------------------------------------------'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all games'
    puts '4. List all genres'
    puts '5. List all labels'
    puts '6. List all authors'
    puts '7. Add book'
    puts '8. Add a music album'
    puts '9. Add a game'
    puts '10. Exit'
  end

  def select_option(option)
    if OPTIONS.key?(option)
      action = OPTIONS[option]
      if action.is_a?(Proc)
        action.call
      else
        send(action)
      end
      exit if option == 10 # Exit if option is 10
    else
      puts '-------------------------------------------'
      puts "\nInvalid option, try again!"
      puts "\n-------------------------------------------"
    end
    sleep(1)
  end

  def get_user_input(prompt)
    print prompt
    gets.chomp
  end
end

Main.new
