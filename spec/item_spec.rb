require './item'

describe Item do
  context '#move_to_archive' do
    let(:category) { double('Label') }
    let(:today) { Date.today.to_s }
    let(:over_decade) { Date.today.prev_year(11).to_s }

    it 'archived variable returns true if publish_date is over 10 years' do
      allow(category).to receive(:add_item)
      item = Item.new(category, over_decade)
      item.move_to_archive
      expect(item.archived).to be_truthy
    end

    it 'archived variable returns false if publish_date is under 10 years' do
      allow(category).to receive(:add_item)
      item = Item.new(category, today)
      item.move_to_archive
      expect(item.archived).to be_falsy
    end
  end
end
