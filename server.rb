require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'redcarpet'
require 'nokogiri'
require 'active_support/all'
require_relative 'helpers'

configure :development do
  also_reload 'helpers.rb'
end

set :public_folder, '.'

helpers AppHelpers

get '/' do
  content = File.read("readme.md")
  erb markdown(content), layout: :"layout.html"
end