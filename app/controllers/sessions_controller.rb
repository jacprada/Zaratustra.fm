class SessionsController < ApplicationController
  def new
    session[:test] = "value"
   end

   def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: "logged in!"
    else
     render "new"
    end
   end

   def destroy
    session[:user_id] = nil
    redirect_to users_path, notice: "logged out!"
   end
end
