class Profile < ActiveRecord::Base
  belongs_to :user
  
  # makes sure all form fields are filled
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :job_title, presence: true
  validates :phone_num, presence: true
  validates :email, presence: true
  validates :description, presence: true
end