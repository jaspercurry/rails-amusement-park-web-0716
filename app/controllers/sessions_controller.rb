class SessionsController < ApplicationController

  def new
  end

  def create
    # binding.pry
    @user = User.find_by_name(params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url_path
  end

end
