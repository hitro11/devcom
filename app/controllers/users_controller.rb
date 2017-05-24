class UsersController < ApplicationController
  
  # GET for user/:user_id
  def show
    @user = User.find(params[:id])
  end
  
end
    