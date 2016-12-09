require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require("pg")


DB = PG.connect({:dbname => 'salon_test'})

#home page
get('/') do
  erb(:index)
end

#shows the list of stylist and allows you add more stylists
get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

#saves stylist entered into form
post('/stylists') do
  name = params.fetch("name")
  stylist = Stylist.new({:id => nil, :name => name})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

#list clients for a specific stylist and allows you to and a client
get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

#update and delete page
get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

#saves updated information
patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

#deletes stylist
delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end

#save client to stylist that was entered into form
post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({:id => nil, :name => name, :stylist_id => stylist_id})
  @client.save()
  erb(:stylist)
end


get("/stylists/:id/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
print @client
  erb(:client_info)
end
