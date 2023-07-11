require './genre'

describe Genre do
  context 'when receiving valid parameters' do
    let(:genre) { Genre.new('Rock') }
    let(:item) { 'sample item' }

    it 'returns a valid Genre object' do
      expect(genre).to be_instance_of(Genre)
    end

    it 'add_item method updates the items instance variable' do
      genre.add_item(item)
      expect(genre.items).to eq([item])
    end
  end

  context 'when receiving invalid parameters' do
    it 'raises an ArgumentError when not given two arguments' do
      expect { Genre.new }.to raise_exception(ArgumentError)
    end
  end
end
