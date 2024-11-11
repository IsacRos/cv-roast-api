Rails.application.routes.draw do
  devise_for :users, path: 'api/v1', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }, controllers: { 
    registrations: 'api/v1/registrations',
    passwords: 'api/v1/passwords',
    sessions: 'api/v1/sessions'
  }

  namespace :api do
    namespace :v1 do
      get 'is-authenticated', to: 'users#is_authenticated'
      post 'roast', to: 'cv#roast'
      get 'roasts/:id', to: 'cv#get_roast'
      get 'roasts', to: 'cv#get_all_roasts'
    end
  end
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
