require_relative 'book'
require_relative 'label_options'

class BookOptions
  attr_accessor :book_instances, :book_ruby_objects

  def initialize
    @book_instances = []
    @book_ruby_objects = []
  end

  def to_ruby_object(book)
    {
      id: book.id,
      title: book.title,
      publisher: book.publisher,
      cover_state: book.cover_state,
      publish_date: book.publish_date
    }
  end

  def list_books
    puts "\n======================================================================"
    puts "\n🚀 Listing books... 🎮"
    puts ''
    sleep(0.5)
    if @book_ruby_objects.empty?
      puts "\n======================================================================"
      puts '||                                                                  ||'
      puts '||                         No books found 😿                        ||'
      puts '||                                                                  ||'
      puts '======================================================================'
    else
      puts "There are #{book_ruby_objects.length} books:"
      @book_ruby_objects.each_with_index do |book, i|
        id = book.id
        title = book.title
        publisher = book.publisher
        cover_state = book.cover_state
        publish_date = book.publish_date

        puts "[#{i}] ID: #{id} - Title: #{title} Publisher: #{publisher} - Cover State: #{cover_state}" \
             " - Publish Date: #{publish_date}"
      end
      puts "\n======================================================================"
    end
    puts ''
  end

  def add_book(label_options)
    puts ''
    puts '🚀 Adding a book... 🎮'
    sleep(0.5)
    puts "\n======================================================================"
    puts ''
    puts 'What is the name of the book?'
    title = gets.chomp
    puts 'What is the publisher\'s name?'
    publisher = gets.chomp
    puts 'What is the cover-state? (good/bad)'
    cover_state = gets.chomp.downcase
    puts 'What is the publish date? (YYYY-MM-DD)'
    publish_date = gets.chomp
    new_book = Book.new(title, publisher, cover_state, publish_date)
    @book_instances << new_book
    @book_ruby_objects.push((new_book))
    label_options.add_label(new_book)
    sleep(0.3)
    puts "\n======================================================================"
    puts '||                                                                  ||'
    puts '||                          😺 Label added! 📕                     ||'
    sleep(0.3)
    puts '||                          🕹️ Book was added! 😼                    ||'
    puts '||                                                                  ||'
    puts '======================================================================'
    puts ''
  end
end
