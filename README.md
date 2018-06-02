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

### Configure

Sinatra 
```ruby
require 'monzenbarai'

Monzenbarai.configure do |config|
  config.expel = lambda do |env|
    return false if env['PATH_INFO'] == '/allowed'
    true
  end
end

use Monzenbarai
```

Ruby on Rails
```ruby:config/application.rb
config.middleware.use Monzenbarai
```

```ruby:config/initializers/monzenbarai.rb
Monzenbarai.configure do |config|
  config.expel = lambda do |env|
    return false if env['PATH_INFO'] == '/allowed'
    true
  end
end
```

If `expel` block returns true, Monzenbarai renders maintenance page.  
By default, `expel` always returns only `true`.

`env` argument is [Rack environment](https://www.rubydoc.info/github/rack/rack/master/file/SPEC).

### Start maintenance mode
Execute `monzenbarai start` command.

### End maintenance mode
Execute `monzenbarai end` command.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takuan-oishii/monzenbarai.  
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
