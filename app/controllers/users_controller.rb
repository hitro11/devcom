class UsersController < ApplicationController
  
  before_action :authenticate_user! #can't see profiles unless you're logged in
  
  # GET for user/:user_id
  def show
    @curr_user = current_user
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.includes(:profile)
  end
  
  
end
    