require 'sinatra/base'

class SampleApp < Sinatra::Base
  get '/' do
    'Hello world!'
  end
  
  get '/hi' do
    'Hi there!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
