class SessionsController < ApplicationController

    

   
    def home 
        @user = User.find_by_id(params[:id])
    end

    def create 
        @user = User.find_by_id(params[:id])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to users_path(@user)
        else
            redirect_to '/login'
        end

    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end