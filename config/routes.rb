Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/', to: 'sessions#index'
  get '/login', to: 'sessions#welcome'
  post '/login', to: 'sessions#create'

  get '/deck', to: 'carddecks#show'
  post '/deck/create_deck', to: 'carddecks#create'

  get '/deck/:deck_id', to: 'cards#view' #<---Needs Verification 
  post '/deck/:deck_id/makeCard', to: 'cards#create' #<---- Needs Verification
  # Defines the root path route ("/")
  # root "articles#index"
end
