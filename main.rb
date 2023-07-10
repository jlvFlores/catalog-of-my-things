class Main
  def initialize
    interface
  end

  OPTIONS = {
    1 => 'future method 1',
    2 => 'future method 2',
    3 => 'future method 3',
    4 => 'future method 4',
    5 => 'future method 5',
    6 => 'future method 6',
    7 => 'future method 7',
    8 => 'future method 8',
    9 => 'future method 9',
    10 => 'future method 10',
    11 => 'future method 11',
    12 => 'future method 12',
    13 => 'Exit'
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
    options_array = ['List all books', 'List all music albums', 'List all movies', 'List all games', 'List all genres',
                     'List all labels', 'List all authors', 'List all sources', 'Add book', 'Add a music album',
                     'Add movie', 'Add a game', 'Exit']
    options_array.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
  end

  def select_option(option)
    if OPTIONS.key?(option)
      puts OPTIONS[option]
      exit if option == 13 # Exit if option is 13
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
