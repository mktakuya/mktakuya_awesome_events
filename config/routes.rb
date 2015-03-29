Rails.application.routes.draw do
  resources :events do
    resources :tickets
  end

  resource :user do
    get 'retire'
  end

  root to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
end
