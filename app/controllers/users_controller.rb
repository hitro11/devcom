class UsersController < ApplicationController
  
  before_action :authenticate_user! #can't see profiles unless you're logged in
  
  # GET for user/:user_id
  def show
    @user = current_user
  end
  
  def index
    @users = User.all
  end
  
  
end
    