class CardsController < ApplicationController
    def new
        @card = Card.new
    end
    def index

    end
    def create
        #params: 
        puts "CARD CREATE"
        #:user_id, deck_id, card
        #@card = Card 
        number = Card.maximum(:id).to_i
        number +=1
        puts "NUMBER: #{number} deck ID #{params[:deckNum].to_i},CQ #{params[:c_q]},CA: #{params[:c_a]}"
        @card = Card.create(id: number, card_q: params[:c_q].to_s, card_a: params[:c_a].to_s, deck_id: params[:deckNum])
        puts"-------------------------------"
        puts "ncard: #{@card.id}, #{@card.deck_id}"

        if @card.save
            puts "MADE IT"
            #redirect_to action:'show'
            #render :show, status: :ok
        else
            puts"Failed to make it"
            render json: @card.errors
            #render :show
        end
    end
    def show
        @deck= CardDeck.where(id: params[:deck_id]).first
        #cardID= params[:cardID]
        @card = Card.where(deck_id: params[:deck_id])
        if(@card)
            puts "cARD CARD CARD"
            render :show, status: :ok
        else
            head :not_found
        end
    end
    def viewcard

    end
    def viewSingle
        cardID = params[:card_id]
        @card
    end
    def edit
    end
    def destroy
        puts "-------------------"
        puts "--------------------"
        puts "CARD DELETING IN PROGRESS!"
        #get specific card to delete
        #remove it;
        @card = Card.where(id: params[:card_id]).first

        if(@card.destroy)
            #puts "CARD DESTROYED!"
               
        else
            puts "ERRROR"
            render json: @card.errors
        end
    end
end
