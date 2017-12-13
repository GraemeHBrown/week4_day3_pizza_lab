require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza')

#index route
get('/pizzas') do
  @pizzas = Pizza.all()
  erb :index
end

#new action
get('/pizzas/new') do
  erb :new
end

#show
get('/pizzas/:id') do
  id = params[:id]
  @pizza = Pizza.find(id)
  erb :show
end

#create
post('/pizzas')do
@pizza = Pizza.new(params)
@pizza.save()
erb :create
end

#edit
get('/pizzas/:id/edit') do
  id = params[:id]
  @pizza = Pizza.find(id)
  erb :edit
end

#update
post('/pizzas/:id') do
  id = params[:id]
  @pizza = Pizza.new(params)
  @pizza.update()
  redirect '/pizzas'
end

# /pizzas/:id/delete

#delete
post('/pizzas/:id/delete') do
  id = params[:id]
  @pizza = Pizza.find(id)
  @pizza.delete()
  redirect'/pizzas'
end
