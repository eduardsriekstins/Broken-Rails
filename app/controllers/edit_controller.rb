class EditController < ApplicationController
  def show
    @user = User.find_by(id: current_user.id)

    @user.email = params[:email]
    @user.email = params[:first_name]
    @user.email = params[:last_name]
    @user.email = params[:password]
    @user.email = params[:password_confirmation]

    if @user.save!
      redirect_to root_path, notice: "Updated successfully."
    else
      render :show, notice: "Failed to update user."
    end

  end

  def update
    @user = User.find_by(params[:id])
    if @user.update(update_params)
      redirect_to root_path, notice: "Updated successfully."
    else
      render :show, notice: "Failed to update user."
    end
  end

  def update_params
    params.permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
