Rails.application.routes.draw do
  resource :rate

  root to: 'rate#show'

  namespace 'admin' do
    resource :fixed_rate

    root to: 'fixed_rates#show'
  end
end
