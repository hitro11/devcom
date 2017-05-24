class UsersController < ApplicationController
  
  # GET for user/:user_id
  def show
    @user = current_user
  end
  
end
    