require_relative 'book'
require_relative 'label'
require 'pry'

class BookOptions
  attr_accessor :book_instances, :book_ruby_objects, :labels

  def initialize(book_instances, labels)
    @book_instances = book_instances
    @labels = labels
  end

  def list_books
    puts "\n======================================================================"
    puts "\n🚀 Listing books... 🎮"
    puts ''
    sleep(0.5)
    if @book_instances.empty?
      puts "\n======================================================================"
      puts '||                                                                  ||'
      puts '||                         No books found 😿                        ||'
      puts '||                                                                  ||'
      puts '======================================================================'
    else
      puts "There are #{book_instances.length} books:"
      @book_instances.each_with_index do |book, i|
        id = book.id
        label = book.label.title
        publisher = book.publisher
        cover_state = book.cover_state
        publish_date = book.publish_date

        puts "[#{i}] ID: #{id} - Label: #{label} Publisher: #{publisher} - Cover State: #{cover_state} - Publish Date: #{publish_date}"
      end
      puts "\n======================================================================"
    end
    puts ''
  end

  def add_book
    puts ''
    puts '🚀 Adding a book... 🎮'
    sleep(0.5)
    puts "\n======================================================================"
    puts ''
    puts 'What is the publisher\'s name?'
    publisher = gets.chomp
    puts 'What is the cover-state? (good/bad)'
    cover_state = gets.chomp.downcase
    puts 'What is the publish date? (YYYY-MM-DD)'
    publish_date = gets.chomp

    puts 'What is the book label?'
    label_name = gets.chomp.capitalize
    matching_label = @labels.find { |label| label.title == label_name }
    if matching_label
      label = matching_label
    else
      puts 'What is the label color?'
      color = gets.chomp
      label = Label.new(label_name, color)
      @labels << label
    end
    new_book = Book.new(label, publisher, cover_state, publish_date)
    @book_instances << new_book
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

  def list_labels
    puts "\n======================================================================"
    puts "\n🔥 Listing labels... 🖋️"
    sleep(0.5)
    puts ''

    if @labels.empty?
      puts "\n======================================================================"
      puts '||                                                                  ||'
      puts '||                        No labels found 😿                       ||'
      puts '||                                                                  ||'
    else
      puts "There are #{@labels.length} labels:"
      puts ''
      @labels.each_with_index do |label, index|
        puts "[#{index + 1}] #{label.title} (#{label.color})"
      end
      puts ''
    end
    puts '======================================================================'
    puts ''
    sleep(0.5)
  end
end
