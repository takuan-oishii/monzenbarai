require 'sinatra'
require 'monzenbarai'

Monzenbarai.configure do |config|
  config.expel = lambda do |env|
    return false if env['PATH_INFO'] == '/allowed'
    true
  end
end

use Monzenbarai

get '/' do
  'this path is not allowed'
end

get '/allowed' do
  'this path is allowed'
end
