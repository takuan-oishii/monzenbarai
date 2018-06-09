module Monzenbarai
  class Context
    def initialize(app)
      @app = app
    end

    def call(env)
      p 'メンテ'

      if render_maintenance?(env)
        [503, { 'Content-Type' => 'text/html', 'Retry-After' => '7200', 'Cache-Control' => 'no-cache' }, ['<h1>maintenance</h1>']]
      else
        @app.call env
      end
    end

    def render_maintenance?(env)
      path = Monzenbarai.configuration.path
      return env['PATH_INFO'] =~ /\A#{path}\z/ if path
      false
    end
  end
end
