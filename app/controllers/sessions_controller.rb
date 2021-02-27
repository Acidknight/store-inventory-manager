class SessionsController < ApplicationController

    

   
    def home 
        @user = User.find_by_id(params[:id])
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user) 
        else
            flash[:error] = "Sorry, your username or password were incorrect."
            redirect_to '/login'
        end
    end

    def google
        @user = User.update_or_create(env["omniauth.auth"])
        session[:id] = user.id 
        redirect_to root_path
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end