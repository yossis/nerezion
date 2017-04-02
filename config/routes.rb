Rails.application.routes.draw do
  resources :contacts
  resources :not_in_lists
  resources :homes
  resources :book_comunities
  resources :pupils

  get '/whos_in', to: 'static_pages#whos_in', as: 'whos_in'
  get '/registration', to: 'static_pages#registration' ,as: 'registration'

  post '/pupils/invite', to: 'pupils#invite'

  root to: 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
