# Monzenbarai

Monzenbarai is simple Rack middleware that allows you to easily put your app in maintenance mode. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'monzenbarai'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monzenbarai

## Usage

Make config file.

```ruby
Monzenbarai.configure do |config|
  config.expel = lambda do |env|
    return false if env['PATH_INFO'] == '/allowed'
    true
  end
  
  config.trigger_file = 'path/to/trigger_file'
end
```

If `expel` block returns true, Monzenbarai renders maintenance page.  
By default, `expel` always returns only `true`.

`env` argument is [Rack environment](https://www.rubydoc.info/github/rack/rack/master/file/SPEC).


Add Monzenbarai middleware  

```ruby
use Monzenbarai # Sinatra
config.middleware.use Monzenbarai # Rails
```

### Start maintenance mode
Execute `monzenbarai start path/to/config_file` command.  
This command makes `trigger_file`.
Monzenbarai keep maintenance mode during `trigger_file` exists.  

### End maintenance mode
Execute `monzenbarai end path/to/config_file` command.
This command removes `trigger_file`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takuan-oishii/monzenbarai.  
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
