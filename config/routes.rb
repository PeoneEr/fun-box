require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resource :rate, only: :show

  root to: 'rate#show'

  namespace 'admin' do
    resource :fixed_rate, except: [:edit, :destroy]

    root to: 'fixed_rates#show'
  end
end
