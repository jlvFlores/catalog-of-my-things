class Main
  def initialize
    interface
  end

  def interface
    show_console_options
    option = get_user_input('Enter your choice: ').to_i
    select_option(option)
    sleep(1)
    if option == 13
      exit
    else 
      interface
    end
  end

  def show_console_options
    options_array = ['List all books', 'List all music albums', 'List all movies', 'List all games', 'List all genres',
                     'List all labels', 'List all authors', 'List all sources', 'Add book', 'Add a music album', 'Add movie',
                     'Add a game', 'Exit']
    puts "\nWelcome to the Ruby Console App!"
    puts "\nPlease choose an option from the list below:"
    puts '-------------------------------------------'
    options_array.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
  end

  def select_option(option)
    case option
    when 1
      puts 'future method 1'
    when 2
      puts 'future method 2'
    when 3
      puts 'future method 3'
    when 4
      puts 'future method 4'
    when 5
      puts 'future method 5'
    when 6
      puts 'future method 6'
    when 7
      puts 'future method 7'
    when 8
      puts 'future method 8'
    when 9
      puts 'future method 9'
    when 10
      puts 'future method 10'
    when 11
      puts 'future method 11'
    when 12
      puts 'future method 12'
    when 13
      puts 'Exit'
    else
      puts '-------------------------------------------'
      puts "\nInvalid option, try again!"
      puts "\n-------------------------------------------"
      sleep(1)
      Main.new
    end
  end

  def get_user_input(prompt)
    print prompt
    gets.chomp
  end
end

Main.new
