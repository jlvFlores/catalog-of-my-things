require './methods'

class Main
  include Methods

  def initialize
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
  }

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
    options_array = ['List all books', 'List all music albums', 'List all games', 'List all genres',
                     'List all labels', 'List all authors', 'Add book', 'Add a music album', 'Add a game',
                     'Exit']
    options_array.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
  end

  def select_option(option)
    if OPTIONS.key?(option)
      send OPTIONS[option]
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
