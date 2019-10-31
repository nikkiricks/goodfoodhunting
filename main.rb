# dependencies = libraries & gems     
require 'sinatra'

if settings.development?
  require 'sinatra/reloader' #depnds on a gem sinatra-contrib
end

require 'pg'
require 'pry'


require_relative 'models/dish.rb'

# routing ######## paths from the route
# routes = http method + path
# MVC model view control - design pattern
# controllers

get '/' do

  @dishes = all_dishes()

  erb :index
end

get '/donate' do
  erb :donate
end

get '/details' do

  #use the name to find the record from the table again

  @dish = find_one_dish(params[:id]) #we are focusing on happy paths

  erb :details
end

get '/new_dish' do


  erb :new
end

#inserting into database
post '/create_dish' do


  create_dish(params[:name], params[:image_url] )

  #make a new request on behalf of the client
  # redirect is a get /
  redirect '/'
end

delete '/destroy_dish' do
  #connect to db
  #prepare sql
  #close connection

  delete_dish(params[:id] )

redirect '/'
end

get '/edit' do
  #building the edit form
  @dish = find_one_dish(params[:id]) #we are focusing on happy paths
  erb :edit
end

patch '/update_dish' do
  conn = PG.connect(dbname: "goodfoodhunting")
  #prepare
  # interpolation
  sql = "UPDATE dishes SET name = '#{params[:name]}', image_url = '#{params[:image_url]}' WHERE id = #{params[:id]};"
  
  # DELETE FROM dishes WHERE id = 7;
  #exec sql
  conn.exec(sql)
  #close connection
  conn.close

  redirect "/details?id=#{params[:id] }"

end


