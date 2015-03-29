Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

  resource :user, only: :destroy do
    get 'retire'
  end

  resources :events, except: :index do
    resources :tickets, only: [:new, :create, :destroy]
  end
  match '*path', to: 'application#error404', via: :all
end
