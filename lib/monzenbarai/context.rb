require 'fileutils'

module Monzenbarai
  class Context
    def initialize(app)
      @app = app
    end

    def call(env)
      if render_maintenance?(env)
        [configuration.status_code, { 'Content-Type' => 'text/html' }, ['<h1>maintenance</h1>']]
      else
        @app.call env
      end
    end

    private

    def render_maintenance?(env)
      maintenance_mode? && configuration.expel.call(env)
    end

    def maintenance_mode?
      File.exist? configuration.trigger_file
    end

    def configuration
      Monzenbarai.configuration
    end
  end
end
