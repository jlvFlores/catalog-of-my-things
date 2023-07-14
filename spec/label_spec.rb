require_relative 'label'

describe Label do
  let(:label) { Label.new('Label 1', 'Red') }

  describe '#initialize' do
    it 'sets the title' do
      expect(label.title).to eq('Label 1')
    end

    it 'sets the color' do
      expect(label.color).to eq('Red')
    end

    it 'sets the items array' do
      expect(label.items).to be_a(Array)
      expect(label.items).to be_empty
    end
  end

  describe '#to_hash' do
    it 'returns a hash with id, title, and color' do
      expected_hash = {
        id: label.id,
        title: 'Label 1',
        color: 'Red'
      }
      expect(label.to_hash).to eq(expected_hash)
    end
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      item = double('Item')
      label.add_item(item)
      expect(label.items).to include(item)
    end
  end
end
