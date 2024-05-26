class SessionsController < ApplicationController

  def new

  end

  def create
    if user = User.find_by(email: params[:email], password: params[:password])
			cookies[:user_id] = user.id
      login user
      redirect_to root_path, notice: "Logged in successfully."
    else
      flash[:error] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout current_user
    redirect_to root_path, notice: "You have logged out."
  end


end