class SamplesController < ApplicationController
  def not_allowed
    render plain: 'this path is not allowed'
  end

  def allowed
    render plain: 'this path is allowed'
  end
end
