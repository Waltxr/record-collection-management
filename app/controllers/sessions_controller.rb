class SessionsController < ApplicationController
    def new

    end

    def create
      @user = User.find_by(email: params[:session][:email])
      return head(:forbidden) unless @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    end

    def destroy
       session.delete :username
    end
end
