require 'spec_helper'

describe(Client) do
  describe('#name') do
    it('will add name of client') do
      test_client = Client.new({:id => nil, :name => 'Cindy', :stylist_id => 1})
      expect(test_client.name()).to(eq('Cindy'))
    end
  end

  describe('#stylist_id') do
    it('will add stylist_id of client') do
      test_client = Client.new({:id => nil, :name => 'Cindy', :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe('.all') do
    it('empty array at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same client if it has the same name') do
      client1 = Client.new({:id => nil, :name => 'Cindy', :stylist_id => 1})
      client2 = Client.new({:id => nil, :name => 'Cindy', :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end

  describe('#save') do
    it('saves user input to database') do
      test_client = Client.new({:id => nil, :name => 'Cindy', :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe(".find") do
   it("returns a client by its ID") do
     test_client1 = Client.new({:id => nil, :name => 'Cindy', :stylist_id => 1})
     test_client1.save()
     test_client2 = Client.new({:id => nil, :name => 'Jessica', :stylist_id => 1})
     test_client2.save()
     expect(Client.find(test_client2.id())).to(eq(test_client2))
   end
 end

 describe('#update') do
   it('will update a record with a change in the database') do
     test_client = Client.new({:id => nil, :name => 'Joe', :stylist_id => 1})
     test_client.save()
     test_client.update({:name => "Joseph"})
     expect(test_client.name()).to(eq("Joseph"))
    end
  end

  describe('#delete') do
    it('will delete a selected record') do
      test_client1 = Client.new({:id => nil, :name => 'Cindy', :stylist_id => 1})
      test_client1.save()
      test_client2 = Client.new({:id => nil, :name => 'Jessica', :stylist_id => 1})
      test_client2.save()
      test_client2.delete()
      expect(Client.all()).to(eq([test_client1]))
    end
  end



end
