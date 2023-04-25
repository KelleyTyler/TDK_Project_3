#require relative 
class SessionsController < ApplicationController
    def index
    end
    def create
        #check to see if user exist and if user is going to pop up.
        creds = JSON.parse(request.body.read)
        user = User.find_by(username: creds['username'])
        if user&.authenticate(creds['password'])
            #render json: {token: JsonWebToken.encode}
            puts 'THERES A THING';
        else
            puts 'Failed to Authenticate'
        end

    end
    def show
    end
end
