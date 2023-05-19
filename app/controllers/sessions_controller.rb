class SessionsController < ApplicationController
   
    # skip_before_action :authorized, only: :create

    # def index 
    # sessions = Session.all
    # render json: sessions
    
    # end
   
    #create sesssion after auth/ need to look into this, name is not a unique identifier, probably solve it with unique usernames
    def create
        user = User.find_by(name: params[:name])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: { message: 'Logged in successfully!', user: user, session: session}, status: :created
 
        else
            render json: { errors: ["Invalid username or passsword"],  }, status: :unauthorized
        end
    end
     
    def destroy
        p session[:user_id]
        if session[:user_id]
            session.delete :user_id
            head :no_content
        else
            render json: { errors: ["Invalid username or passsword"], session: session }, status: :unauthorized
        end
    end
end