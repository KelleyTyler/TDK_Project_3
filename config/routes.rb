Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/', to: 'sessions#index'
  post '/login', to: 'sessions#create'
  # Defines the root path route ("/")
  # root "articles#index"
end
