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

    it "to_hash method returns a hash of the class's data" do
      expected_return = { first_name: author.first_name, last_name: author.last_name, items: author.items }
      expect(author.to_hash).to eq(expected_return)
    end
  end

  context 'when receiving invalid parameters' do
    it 'raises an ArgumentError when not given two arguments' do
      expect { Author.new('first') }.to raise_exception(ArgumentError)
    end
  end
end
