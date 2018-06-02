module Monzenbarai
  class Configuration
    attr_accessor :expel
    attr_accessor :status_code
    attr_accessor :trigger_file

    def initialize
      self.expel        = lambda { |_env| true }
      self.status_code  = 503
      self.trigger_file = './monzenbarai.trigger'
    end
  end
end
