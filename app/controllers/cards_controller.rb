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
        if(number==nil)
        number = 0
        end
        number +=1
        puts "NUMBER: #{number} deck ID #{params[:deckNum].to_i},CQ #{params[:c_q]},CA: #{params[:c_a]}"
        @cardDeck = CardDeck.where(id: params[:deckNum]).first
        @card = Card.create(id: number.to_i, card_q: params[:c_q].to_s, card_a: params[:c_a].to_s, deck_id: params[:deckNum])
        puts"-------------------------------"
        puts "ncard: #{@card.id}, #{@card.deck_id}"

        if @card.save
            #puts "MADE IT"
            redirect_to "/card/#{params[:deckNum].to_i}"
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
            #puts "cARD CARD CARD"
            render :show, status: :ok
        else
            head :not_found
        end
    end
    
    def study
        #cardID = params[:card_id]
        @cards = Card.where(deck_id: params[:deck_id])

    end
    def edit
        @card = Card.where(id: params[:card_id]).first
    end
    def change
        @deck= CardDeck.where(id: params[:deck_id]).first
        @card = Card.where(id: params[:id_num]).first
        @card.update(id: params[:id_num],card_q: params[:c_q], card_a: params[:c_a])

        if @card.save()
            redirect_to '/'
        else

        end

    end
    def destroy
        puts "-------------------"
        puts "--------------------"
        puts "CARD DELETING IN PROGRESS!"
        #get specific card to delete
        #remove it;
        @card = Card.where(id: params[:card_id]).first
        @wow = CardDeck.where(id: @card.deck_id).first
        if(@card.destroy)
            #puts "CARD DESTROYED!"
            redirect_to "/card/#{@wow.id}"
        else
            puts "ERRROR"
            render json: @card.errors
        end
    end
end
