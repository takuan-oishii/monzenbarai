require 'monzenbarai/version'

module Monzenbarai
  class << self
    def new(app)
      Context.new(app)
    end

    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Monzenbarai::Configuration.new
    end
  end

  autoload :Configuration, 'monzenbarai/configuration'
  autoload :Context, 'monzenbarai/context'
end
