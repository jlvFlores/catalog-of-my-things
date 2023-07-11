require_relative '../item'
require_relative '../book'

describe Book do
  describe '#can_be_archived?' do
    it 'returns true if cover state is bad' do
      book = Book.new('param1', 'bad', 'param3')
      expect(book.can_be_archived?).to be_truthy
    end

    it 'returns false if cover state is not bad' do
      book = Book.new('param1', 'good', 'param3')
      expect(book.can_be_archived?).to be_falsy
    end
  end
end
