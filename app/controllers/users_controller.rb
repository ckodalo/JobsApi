class UsersController < ApplicationController
    
     #before_action :authorize
     #skip_before_action :authorize, only: [:create]
  
    def index
        users = User.all
        render json: users
    end


    def create
        user = User.create!(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: { message: 'User account successfully created!', user: user  }, status: :created
        else
            render json: { message: 'Failed to create user account', errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    
    end

   

    # def auth
        
    #     user = User.find_by(id: session[:user_id])
    #     if user
    #         render json: user
    #     else
    #         render json: { error: "Not authorized" }, status: :unauthorized
    #     end
    # end



     def show
        
         user = User.find_by(id: session[:user_id])
         if user
             render json: user
         else
             render json: { error: "Not authorized" }, status: :unauthorized
         end
     end


    

    private

        def user_finder
            user = User.find_by(id: params[:id])
        end

         def user_params
            params.permit(:name, :password, :password_confirmation)
          end

        def render_not_found_response
            render json: { error: "User not found" }, status: :not_found
        end
end
