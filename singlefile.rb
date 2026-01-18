# Ruby version check
raise "Ruby 3.2+ required (you have #{RUBY_VERSION})" unless RUBY_VERSION >= "3.2"

require 'bundler/inline'

gemfile(true) do
  source 'https://rubygems.org'
  ruby '3.2.0'

  gem 'sinatra', '~> 4.1.1'
  gem 'sinatra-contrib', '~> 4.1.1'
  gem 'sinatra-activerecord', '~> 2.0.28'
  gem 'activesupport', '~> 7.2.3'
  gem 'puma', '~> 6.5.0'
  gem 'rackup', '~> 2.2.1'
  gem 'redcarpet', '~> 3.6.0'
  gem 'nokogiri', '~> 1.18.9'
  gem 'passenger', '~> 6.0.27'
  gem 'pg', '~> 1.6.3'
  gem 'rake', '~> 13.3.0'
  gem 'bcrypt', '~> 3.1.21'
  gem 'dotenv', '~> 3.2.0'
end

require 'dotenv/load'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?
require 'redcarpet'
require 'nokogiri'
require 'active_support/all'
require 'bcrypt'
require_relative 'helpers'
require_relative 'db/models/user'

set :database_file, File.expand_path('db/database.yml', __dir__)
set :views, File.expand_path('views', __dir__)
set :public_folder, File.expand_path('.', __dir__)

configure :development do
  also_reload 'helpers.rb'
  also_reload 'db/models/*.rb'
end

helpers AppHelpers

set :host_authorization, { permitted_hosts: ['single-file.dev', 'localhost'] }
# Disable X-Frame-Options to allow iframe embedding
set :protection, except: [:frame_options]

before do
  # Allow embedding in iframes from any origin
  headers['Content-Security-Policy'] = "frame-ancestors *"
end

# Enable sessions for user authentication
enable :sessions
set :session_secret, ENV['SESSION_SECRET'] || 'change_me_in_production'

# Public routes
get '/' do
  @content = File.read("readme.md")
  view :"pages/home"
end

get "/about" do
  @content = File.read("readme.md")
  view :"pages/about"
end

# Login routes
get '/login' do
  redirect '/' if logged_in?
  view :"pages/login"
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user&.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Invalid email or password"
    view :"pages/login"
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end

port = ENV['PORT'] || ARGV.find { |arg| arg =~ /^-p(\d+)$/ && $1 } || ARGV[ARGV.index('-p') + 1] rescue nil || 4567
set :port, port.to_i

puts "✓ SingleFile starting on http://localhost:#{port}"
Sinatra::Application.run!
