class Client

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      id = client.fetch('id').to_i()
      name = client.fetch('name')
      clients.push(Client.new({:id => id, :name => name}))
    end
    clients
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.id().==(another_client.id()))
  end

  define_method(:save) do
    record = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = record.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |id|
    found_client = nil
    Client.all().each() do |client|
      if client.id() == (id)
        found_client = client
      end
    end
    found_client
  end



end
