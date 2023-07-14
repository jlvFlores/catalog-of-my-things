require './author'

describe Author do
  context 'when receiving valid parameters' do
    let(:author) { Author.new('first', 'last') }
    let(:item) { 'sample item' }

    it 'returns a valid Author object' do
      expect(author).to be_instance_of(Author)
    end

    it 'add_item method updates the items instance variable' do
      author.add_item(item)
      expect(author.items).to eq([item])
    end
  end

  context 'when receiving invalid parameters' do
    it 'raises an ArgumentError when not given two arguments' do
      expect { Author.new('first') }.to raise_exception(ArgumentError)
    end
  end
end
