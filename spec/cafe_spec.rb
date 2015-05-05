require('rspec')
require('cafe')
require('food')

describe('Cafe') do

  describe('#name') do
    it('returns the name of the users cafe') do
      test_cafe = Cafe.new({:name => "Jenn's Cafe", :id => nil})
      expect(test_cafe.name()).to(eq("Jenn's Cafe"))
    end
  end
end
