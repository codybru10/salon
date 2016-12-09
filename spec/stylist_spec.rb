require 'spec_helper'

describe(Stylist) do
  describe('#name') do
    it('will add name of stylist') do
      test_stylist = Stylist.new({:id => nil, :name => 'Cody'})
      expect(test_stylist.name()).to(eq('Cody'))
    end
  end

  describe('#all') do
    it('empty array at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end



end
