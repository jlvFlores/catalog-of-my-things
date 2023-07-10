require_relative '../author'
require_relative '../item'
RSpec.describe Author do
  describe '#Testing Author class ' do
    before(:each) do
      @author = Author.new('Haftamu', 'Desta')
      @item = Item.new
      @author.add_item(@item)
    end

    it 'Returns first name of the instance' do
      expect(@author.first_name).to eql 'Haftamu'
    end
    it 'Returns last name of the instance' do
      expect(@author.last_name).to eql 'Desta'
    end

    it 'Returns instance of class author' do
      expect(@author).to be_instance_of Author
    end

    it 'Return the item array length ' do
      expect(@author.items.length).to be > 0
    end
  end
end
