Rails.application.routes.draw do
  resources :books
  get '/books?'+to_query("query") ,to: 'books#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # jsonapi_resources :books
  #
end
