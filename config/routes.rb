Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :csv_files

    #root to: 'books#index'
    root to: 'static_pages#home' #, layout: 'application_login_register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
     get '/static_pages/home', to: 'static_pages#home', as: 'home_page'

end
