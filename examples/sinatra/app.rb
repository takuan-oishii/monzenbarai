require 'sinatra'
require 'monzenbarai'
require './monzenbarai_config'

use Monzenbarai

get '/' do
  'this path is not allowed'
end

get '/allowed' do
  'this path is allowed'
end
