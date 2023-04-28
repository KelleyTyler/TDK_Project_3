Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/', to: 'sessions#index'
  get '/login', to: 'sessions#welcome'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/deck/show/:uID', to: 'card_decks#show'
  get '/deck/create_deck/', to: 'card_decks#create'
  post '/deck/make/', to: 'card_decks#make' 
  get '/deckDestroy/:deck_id', to: 'card_decks#destroy'
  #<---Needs Verification 
  #get '/card/:card_id'
  
  #post '/card/makeCard', to: 'cards#create' #<---- Needs Verification
  get '/card/:deck_id', to: 'cards#show' 
  post '/card/make', to:'cards#create'
  #put '/card/:card_id', to: 'cards#edit'
  get '/cardDelete/:card_id', to: 'cards#destroy'
  get '/cardEdit/:card_id', to: 'cards#edit'
  get '/cardChange/',to: 'cards#change'
  # Defines the root path route ("/")
  # root "articles#index"
end
