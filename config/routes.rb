Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'login', sign_up: 'register' }
  resources :portfolios do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'
  get 'about-me', to: 'pages#about'
  # get 'pages/about'
  get 'contact', to: 'pages#contact'
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
