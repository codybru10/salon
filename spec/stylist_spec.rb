require 'spec_helper'

describe(Stylist) do
  describe('#name') do
    it('will add name of stylist') do
      test_stylist = Stylist.new({:id => nil, :name => 'Cody'})
      expect(test_stylist.name()).to(eq('Cody'))
    end
  end

  describe('.all') do
    it('empty array at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same stylist if it has the same name') do
      stylist1 = Stylist.new({:id => nil, :name => 'Cody'})
      stylist2 = Stylist.new({:id => nil, :name => 'Cody'})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe('.save') do
    it('saves user input to database') do
      test_stylist = Stylist.new({:id => nil, :name => 'Cody'})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe(".find") do
   it("returns a stylist by its ID") do
     test_stylist1 = Stylist.new({:id => nil, :name => 'Cody'})
     test_stylist1.save()
     test_stylist2 = Stylist.new({:id => nil, :name => 'John'})
     test_stylist2.save()
     expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
   end
 end

 describe('#update') do
   it('will update a record with a change in the database') do
     test_stylist1 = Stylist.new({:id => nil, :name => 'Cody'})
     test_stylist1.save()
     test_stylist1.update({:name => "JoAnn"})
     expect(test_stylist1.name()).to(eq("JoAnn"))
    end
  end

  describe('#delete') do
    it('will delete a record from the database') do
      test_stylist1 = Stylist.new({:id => nil, :name => 'Cody'})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:id => nil, :name => 'John'})
      test_stylist2.save()
      test_stylist1.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end
  end

  describe("#clients") do
     it("returns all clients of a stylists") do
       stylist = Stylist.new({:id => nil, :name => 'Toni'})
       stylist.save()
       client1 = Client.new({:id => nil, :name => 'Ashley', :stylist_id => nil})
       client1.save
       client2 = Client.new({:id => nil, :name => 'Mary', :stylist_id => nil})
       client2.save   
       expect(stylist.clients()).to(eq([client1, client2]))
     end
   end



end
