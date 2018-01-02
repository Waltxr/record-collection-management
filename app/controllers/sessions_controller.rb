class SessionsController < ApplicationController
    def new

    end

    def create
      if @user = User.find_by(email: params[:session][:email]) 
        @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to login_path
      end
    end

    def destroy
       session.delete :username
       redirect_to login_path
    end
end
