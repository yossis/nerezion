require 'sidekiq/web'

Rails.application.routes.draw do
  resources :memorials
  resources :books
  resources :contacts
  resources :not_in_lists
  resources :homes
  resources :pupils

  get '/whos_in', to: 'static_pages#whos_in', as: 'whos_in'
  get '/registration', to: 'static_pages#registration' ,as: 'registration'
  get '/book_memorials', to: 'static_pages#book_memorials', as: 'book_memorials'

  post '/pupils/invite', to: 'pupils#invite'
  post '/static_pages/login', to: 'static_pages#login'

  mount Attachinary::Engine => "/attachinary"
  mount Sidekiq::Web => '/sidekiq'

  root to: 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
