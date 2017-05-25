module UsersHelper
  def job_title_icon
    if @user.profile.job_title == "Developer"
      "<i class='fa fa-code job-icon-dev'></i>".html_safe
      
    elsif @user.profile.job_title == "Entrepreneur"
      "<i class='fa fa-lightbulb-o job-icon-ent'></i>".html_safe

     elsif @user.profile.job_title == "Investor"
      "<i class='fa fa-money job-icon-inv'></i>".html_safe
    end
  end
end