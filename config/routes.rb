Rails.application.routes.draw do
  resources :comments

  scope '(:locale)', locales: /en|pt-BR/ do
    devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'login', sign_up: 'register' }
    resources :portfolio, controller: 'portfolios' do
      put :sort, on: :collection
    end
    get 'about-me', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    resources :topics, only: %i[show]
    resources :blogs do
      member do
        get :toggle_status
      end
    end
  end
  mount ActionCable.server, at: '/cable'
  get '/:locale' => 'pages#home', :locale => /en|pt-BR/
  root to: 'pages#home'
end
