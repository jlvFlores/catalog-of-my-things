require './game'
require './author'
require 'date'

class GameManager
  attr_reader :games, :authors

  def initialize(games, authors)
    @games = games
    @authors = authors
  end

  def multiplayer?(multiplayer)
    multiplayer ? '' : 'NOT '
  end

  def list_games
    @games.each_with_index do |game, index|
      puts "Game (#{index + 1}) was published on #{game.publish_date} by '#{game.author.last_name}' and last played on #{game.last_played_at}, it does #{multiplayer?(game.multiplayer)}have multiplayer/"
    end
  end

  def list_authors
    @authors.each_with_index { |author, index| puts " #{index + 1}) Name: '#{author.first_name} #{author.last_name}'" }
  end

  def add_game
    puts "What is the game author's first name?"
    author_first_name = get_user_input("First name: ").capitalize
    puts "What is the game author's last name?"
    author_last_name = get_user_input("Last name: ").capitalize
    matching_author = @authors.find { |author| author.first_name == author_first_name && author.last_name == author_last_name }
    if matching_author
      author = matching_author
    else
      author = Author.new(author_first_name, author_last_name)
      @authors << author
    end
    puts "When was the last time you played this game?"
    last_played_at = get_user_input_date('Date (yyyy-mm-dd): ')
    puts "When was it published?"
    publish_date = get_user_input_date('Publish date (yyyy-mm-dd): ')
    multiplayer = get_user_input_bool('Is it on multiplayer? ')
    game = Game.new(author, publish_date, multiplayer, last_played_at) # Class, 'yyyy-mm-dd', true or false, 'yyyy-mm-dd'
    @games << game
  end

  def get_user_input(prompt)
    print prompt
    gets.chomp
  end

  def get_user_input_date(prompt)
    input = get_user_input(prompt)

    begin
      date = Date.parse(input)
      raise ArgumentError unless date.strftime('%Y-%m-%d') == input

      input
    rescue ArgumentError, TypeError
      puts 'Invalid date format. Please enter a date in the format yyyy-mm-dd.'
      get_user_input_date(prompt)
    end
  end

  def get_user_input_bool(prompt)
    input = get_user_input(prompt).downcase

    case input
    when 'true', 'yes', 'y'
      true
    else
      false
    end
  end
end
