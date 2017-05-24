class ProfilesController < ApplicationController
  
  # GET to /users/:user_id/profile/new
  def new
    @profile = Profile.new
  end
  
  def create
      @user = User.find(params[:user_id])
      @profile = @user.build_profile(profile_params)
      
      if @profile.save
        redirect_to user_path(id: current_user.id)
      else
        render action: :new
      end
  end
  
 private
      #to collect data from forms, need to use strong params and whitelist form fields.
      def profile_params
          params.require(:profile).permit(:first_name, :last_name, :job_title, :email, :phone_num, :description)
      end
end