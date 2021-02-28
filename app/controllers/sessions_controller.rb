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
        
    end

    def omniauth
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
        end
        if user.valid?
            session[:id] = user.id 
            redirect_to root_path
        else
            redirect_to '/login'
        end
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