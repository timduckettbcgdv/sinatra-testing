require "rubygems"
require "sinatra/base"
require "data_mapper"
require "json"
require "dm-serializer"

require_relative "models"
require_relative "generator"

# An in-memory Sqlite3 connection:
DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.finalize
DataMapper.auto_migrate!

# create stub data
generator = Generator.new
generator.generate

class SampleApp < Sinatra::Base

  get '/' do
    'Hello world!'
  end
  
  get '/hi' do
    'Hi there!'
  end
 
  get '/users' do
    
    content_type :json

    users_array = Array.new
    
    User.all.each.map { |user|
      
      user_hash = { :firstname => user.firstname,
                    :lastname => user.lastname }
                    
                    users_array.push(user_hash)
      
    }
    
    { "users" => users_array }.to_json
    
  end

  get '/:id/accounts' do
    
    content_type :json

    user_id = params['id']
    user = User.get(user_id)
    accounts = user.accounts
    
    accounts_array = Array.new

    accounts.each.map { |account|
      the_hash = { "id" => account.id, "balance" => account.balance }
      accounts_array.push(the_hash)
    }
    
    { "id" => user_id,
      "firstname" => user.firstname,
      "lastname" => user.lastname,
      "accounts" => accounts_array }.to_json
    
  end

  
  # start the server if ruby file executed directly
  run! if app_file == $0

end