lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monzenbarai/version'

Gem::Specification.new do |spec|
  spec.name    = 'monzenbarai'
  spec.version = Monzenbarai::VERSION
  spec.authors = ['takuan-oishii']
  spec.email   = ['met.enkephalin@gmail.com']

  spec.summary     = %q{simple rack app maintenance gem}
  spec.description = %q{Monzenbarai is simple Rack middleware that allows you to easily put your app in maintenance mode}
  spec.homepage    = 'https://github.com/takuan-oishii/monzenbarai'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = ['monzenbarai']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'thor'
  # spec.add_development_dependency 'rspec', '~> '
end
