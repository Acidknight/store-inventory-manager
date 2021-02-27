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

    def facebook
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
        end
     
        session[:user_id] = @user.id
     
        render :new
      end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    def fbcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.password = SecureRandom.hex(10)
        end
          session[:user_id] = @user.id
          flash[:success] = "Welcome back #{@user.name}!"
          redirect_to user_path(@user)
      end

    private

    def auth
        request.env['omniauth.auth']
    end

end