class UsersController < ApplicationController
  skip_forgery_protection

  def new
    @user = User.new
  end

  def edit_password
    @user = current_user
  end

  def show

  end

  def create
    response.headers['Set-Cookie'] = 'SameSite=None'
    @user = User.new(user_params)
    if @user.save
      cookies[:user_id] = { 
        same_site: "None"
      }
      cookies[:user_name] = { 
        same_site: "None"
      }
      cookies[:user_id] = @user.id
      cookies[:user_name] = @user.first_name
      redirect_to :root, notice: "User was successfully created."
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def update
    message = false

    if @user
      @user.update(user_params)
      if params[:user][:password].present? && (params[:user][:password] == params[:user][:password_confirmation])
        @user.password = params[:user][:password]
      end
      message = true if user.save!
      respond_to do |format|
        format.html { redirect_to user_account_settings_path(user_id: current_user.id) }
        format.json { render json: {msg: message ? "success" : "false "} }
      end
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

end