class Stylist

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      id = stylist.fetch('id').to_i()
      name = stylist.fetch('name')
      stylists.push(Stylist.new({:id => id, :name => name}))
    end
    stylists
  end

  define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name()).&(self.id().==(another_stylist.id()))
  end

  define_method(:save) do
    record = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = record.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id() == (id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{self.id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id};")
  end

  define_method(:clients) do
    list_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      id = client.fetch('id').to_i()
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id').to_i()
      list_clients.push(Client.new({:id => id, :name => name, :stylist_id => stylist_id}))
    end
    list_clients
  end


end
