require 'rubygems'
require 'active_record'
require 'sqlite3'
require_relative '../establish_connection.rb'

ActiveRecord::Migration.create_table :users do |t|
  t.string :firstname
  t.string :lastname
  t.integer :salary
end
