require('rspec')
require('food')

describe('Food') do

  describe('#type') do
    it('returns the type of the users cafe') do
      test_type = Food.new({:type => "French", :id => nil})
      expect(test_type.type()).to(eq("French"))
    end
  end
end
