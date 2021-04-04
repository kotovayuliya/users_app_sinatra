require 'rubygems'
require 'sinatra'
require 'active_record'
require 'sqlite3'

require_relative 'models/user.rb'
require_relative 'establish_connection.rb'

['/',  'users/new'].each do |path|
  get path do
    erb 'users/new'.to_sym
  end
end

post '/' do
  User.create(params['user'])
  redirect '/users'
end

get '/users' do
  @users = User.all
  erb 'users/index'.to_sym
end
