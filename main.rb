#Plan. essentially make coles self serve check out. one database all the options, then columns that mark out the genre of option (diary, meat, etc), the user has a tab across the screen to cycle to genres. then there are form for each option, the form is unqiue to each option and the user selects a quantity. when they have done so the page sends the form back to the database which adds the selected options quantity to a temporary table which is the users selection. the temporary table is displayed on the right hand side of the screen and includes the prices, quantities and total price. when the user hits buy the temporary table is rendered into a receipt and then deleted. if the user was logged in they have an option to save their receipt/temporary table as a unique table in the database. each option will have an id, title, cost per unit, quantity, type of unit. so a bottle of milk is an item with quantity 1. and bacon is an item that you can have a quantity of 500 and the type of unit being gram.
#home page will be an option between log in and start.
#after login an option between view all receipts and start
#view all receipts will list out all receipt id and total cost and link to a details page
#product_id, product_name, unit_cost, unit_type, quantity    
#mvp start with no genres and a few items


require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'lib/helpers.rb'
require_relative 'models/list.rb' 
require_relative 'models/user.rb' 
require 'bcrypt'
require 'securerandom'  


also_reload 'models/list.rb' if development?
also_reload 'models/user.rb' if development?

enable :sessions

#home
get '/' do
  session[:shopping_id] = SecureRandom.uuid
  redirect '/shop'
end


#sign up
get '/sign_up' do
  erb :sign_up
end

post '/create_user' do
  password = params[:password]
  email = params[:email]
  password_digest = BCrypt::Password.create(password)
  user = create_user(email, password_digest)
  session[:user_id] = user['id']
  redirect '/'
end  

#log in and session stuff
get '/log_in' do
  session[:shopping_id] = nil
  erb :log_in
end 

post '/session' do
  user = find_user_by_email(params[:email])
  if user && BCrypt::Password.new(user["password_digest"]) == params[:password]
    session[:user_id] = user['id']
    redirect '/shop'
  else
    erb :log_in
  end  
end

delete '/session' do
  session[:user_id] = nil
  redirect '/log_in'
end


get '/view_my_receipts' do
  delete_receipt_with_this_shopping_id = params["delete"]
  delete_receipt(delete_receipt_with_this_shopping_id)
  user_id = session[:user_id].to_i
  user_receipts = find_user_receipts(user_id)
  erb :view_my_receipts, locals: { user_receipts: user_receipts }
end

get '/log_out' do
  session[:user_id] = nil

  redirect '/'
end  


#shopping

get '/shop' do
  current_items = get_current_items(session[:shopping_id])
  groceries = get_all_items()

  erb :shop, locals: { shopping_id: session[:shopping_id], current_items: current_items, groceries: groceries }
end  

post '/update_receipt_db' do
  product_id  = params[:product_id]
  quantity = params[:quantity]
  # update the receipt database with the quantity of the item selected with the session id
  if check_for_receipt(session[:shopping_id], product_id)
    existing_receipt = check_for_receipt(session[:shopping_id], product_id)
    change_quantity_on_existing_receipt(session[:shopping_id], product_id, quantity, existing_receipt)
  else
    insert_new_receipt(session[:shopping_id], product_id, quantity)
  end
  redirect '/shop'
end  


get '/my_receipt/:shopping_id' do
  current_items = get_current_items(params[:shopping_id])
  erb :my_receipt, locals: { current_items: current_items }
end 

delete '/my_receipt/:shopping_id' do
  delete_receipt(params["shopping_id"])
  redirect '/view_my_receipts'
end  

get '/clear' do
  redirect '/'
end



