class HiddenController < ApplicationController
  def show
    @result = "#{params[:number1]}#{params[:expression]}#{params[:number2]}"
  end
end
