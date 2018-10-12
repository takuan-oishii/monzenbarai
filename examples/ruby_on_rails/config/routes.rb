Rails.application.routes.draw do
  root 'samples#not_allowed'
  get 'allowed', to: 'samples#allowed'
end
