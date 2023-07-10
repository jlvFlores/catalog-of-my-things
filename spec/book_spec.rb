require_relative '../book'

describe Book do
  before :each do
    @publisher = 'publisher'
    @cover_state = 'cover_state'
    @book = Book.new(@publisher, @cover_state, '2022/2/3')
  end

  describe '#new' do
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

  describe '#can_be_archived?' do
    it 'returns true if date is older than 10 years' do
      book = Book.new(@publisher, @cover_state, '2009/1/1')
      expect(book.can_be_archived?).to be_truthy
      expect(book.archived).to be_truthy # Check archived instance variable
    end
    it 'returns true if cover state is bad' do
      book = Book.new(@publisher, 'bad', '2021/1/1')
      expect(book.can_be_archived?).to be_truthy
      expect(book.archived).to be_truthy # Check archived instance variable
    end
    it 'returns false if date is not older than 10 years and cover_state is not bad' do
      book = Book.new(@publisher, 'good', '2021/1/1')
      expect(book.can_be_archived?).to be_falsy
      expect(book.archived).to be_falsy # Check archived instance variable
    end
  end
end
