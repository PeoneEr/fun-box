Rails.application.routes.draw do
  resource :rate

  root to: 'rate#show'
end
