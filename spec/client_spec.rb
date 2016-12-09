require 'spec_helper'

describe(Client) do
  describe('#name') do
    it('will add name of client') do
      test_client = Client.new({:id => nil, :name => 'Cindy'})
      expect(test_client.name()).to(eq('Cindy'))
    end
  end

#   describe('.all') do
#     it('empty array at first') do
#       expect(Stylist.all()).to(eq([]))
#     end
#   end
#
#   describe('#==') do
#     it('is the same stylist if it has the same name') do
#       stylist1 = Stylist.new({:id => nil, :name => 'Cody'})
#       stylist2 = Stylist.new({:id => nil, :name => 'Cody'})
#       expect(stylist1).to(eq(stylist2))
#     end
#   end
#
#   describe('.save') do
#     it('saves user input to database') do
#       test_stylist = Stylist.new({:id => nil, :name => 'Cody'})
#       test_stylist.save()
#       expect(Stylist.all()).to(eq([test_stylist]))
#   binding.pry
#     end
#   end
#
#   describe(".find") do
#    it("returns a stylist by its ID") do
#      test_stylist1 = Stylist.new({:id => nil, :name => 'Cody'})
#      test_stylist1.save()
#      test_stylist2 = Stylist.new({:id => nil, :name => 'John'})
#      test_stylist2.save()
#      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
#    end
#  end
#
#
#
end
