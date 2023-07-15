require './book'
require 'date'

describe Book do
  before :each do
    @label = Label.new('title', 'color')
    @publisher = 'publisher'
    @cover_state = 'cover_state'
    @publish_date = '2022/2/3'
    @book = Book.new(@label, @publisher, @cover_state, @publish_date)
  end

  context '#new' do
    it 'will create a new book' do
      expect(@book).to be_instance_of(Book)
    end
    it 'will throw an error without three arguments' do
      expect { Book.new('Publisher', 'CoverState') }.to raise_error(ArgumentError)
    end
    it 'will have all properties' do
      expect(@book.cover_state).to eq(@cover_state)
      expect(@book.publisher).to eq(@publisher)
    end
  end

  context '#can_be_archived?' do
    it 'returns true if date is older than 10 years and cover_state is bad' do
      book = Book.new(@label, @publisher, 'bad', '2009/1/1')
      book.move_to_archive
      expect(book.archived).to be_truthy # Check archived instance variable
    end
    it 'returns true if date is older than 10 years and cover_state is not bad' do
      book = Book.new(@label, @publisher, 'good', '2009/1/1')
      book.move_to_archive
      expect(book.archived).to be_truthy # Check archived instance variable
    end
    it 'returns true if date is not older than 10 years and cover_state is bad' do
      book = Book.new(@label, @publisher, 'bad', '2021/1/1')
      book.move_to_archive
      expect(book.archived).to be_truthy # Check archived instance variable
    end
    it 'returns false if date is not older than 10 years and cover_state is not bad' do
      book = Book.new(@label, @publisher, 'good', '2021/1/1')
      book.move_to_archive
      expect(book.archived).to be_falsy # Check archived instance variable
    end
  end

  context '#to_hash' do
    it "returns a hash of the class's data" do
      expected_return = { label: @label.to_hash, publisher: @publisher, cover_state: @cover_state, publish_date: Date.parse(@publish_date) }
      expect(@book.to_hash).to eq(expected_return)
    end
  end
end
