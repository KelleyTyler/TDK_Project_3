#require relative 
class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        #render
    end
    def welcome
        
    end
    def create
        puts 'ONE'
        
        #check to see if user exist and if user is going to pop up.
       creds = JSON.parse(request.body.read)
        puts 'TWO'
        user = User.find_by(username: creds['username'])
        if user&.authenticate(creds['password'])
            #render json: {token: JsonWebToken.encode}
            puts 'SUCCESS';
            #render :loggedIn
        else
            puts 'Failed to Authenticate'
            #render :loginFailed
        end

    end
    def destroy
        render :loggedOut
    end
end
