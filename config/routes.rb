Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'login', sign_up: 'register' }

  resources :portfolios do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :topics, only: %i[show]
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  mount ActionCable.server, at: '/cable'
  root to: 'pages#home'
end
