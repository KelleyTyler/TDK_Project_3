#require relative 
class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        #render
        @user = User.new
        if((cookies[:user]==''))
            redirect_to action: 'welcome'
        else
           puts "COOKIES: #{cookies[:user]}"
           @user = JSON.parse(cookies[:user])
        end
    end
    def welcome
        if((cookies[:user]!=''))
            redirect_to action:'index'
        end
    end
    def create
        puts 'ONE'
        #credparams = 
        #check to see if user exist and if user is going to pop up.
        #creds = JSON.parse(request.body.read)
       
        @user = User.find_by(username: params[:usrname])
        #puts "TWO #{@user.username},#{@user.password}"
        #user = User.find_by(username: creds['username'])
        
        if @user&.authenticate(params[:pssword])
            #render json: {token: JsonWebToken.encode}
            puts 'SUCCESS';
            cookies[:user] = @user.to_json
            redirect_to action:'index'
            #render :loggedIn
        else
            puts 'Failed to Authenticate'
            #render :loginFailed
        end

    end
    def destroy
        cookies[:user]=nil
        render :loggedOut
    end
end
