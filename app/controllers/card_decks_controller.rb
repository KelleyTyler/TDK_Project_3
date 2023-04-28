class CardDecksController < ApplicationController
    def new
        @card_deck = CardDeck.new
    end
    def index
    end
    def create
        @user = JSON.parse(cookies[:user])
        #maybe a confirmation of ID
        @number = CardDeck.maximum(:id);
        @number

    end
    def make
        #has these parameters coming in:
        #:dname (deckname)
        #idnum (the id number to push)
        #user_id(the id of the user)
        puts "---------"
        puts "USER ID: #{params[:uID]}, NAME: #{params[:dname]} ID: #{params[:idnum].to_i}"
        #@newDeck = CardDeck.new(id: params[:idnum], name: params[:dname], user_id: params[:user_id])

        @newDeck = CardDeck.new(id: params[:idnum], name: params[:dname], user_id: params[:uID])

        if @newDeck.save
            #status: ok   
        else
            render json: @newDeck.errors , status: :unprocessable_entity
        end
    end
    def view
    #possible placeholder
    end

    def show 
        #userID = params[:uID]
        @user = JSON.parse(cookies[:user])
        @card_decks = CardDeck.where(user_id: @user["id"])
        #@number =  CardDeck.maximum(:id);
        if(@card_decks)
            puts"DECKS DECKS DECKS #{@card_decks}"
            #render json: {card_deck: @card_decks}, status: :ok
        else
            head :not_found
        end
    end
    def edit
    end
    def destroy
    end
end
