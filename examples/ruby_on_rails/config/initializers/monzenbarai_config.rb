Monzenbarai.configure do |config|
  config.expel = lambda do |env|
    return false if env['PATH_INFO'] == '/allowed'
    true
  end

  config.trigger_file = 'tmp/monzenbarai_trigger'
end
