class Profile < ActiveRecord::Base
  
  belongs_to :user
  
  has_attached_file :avatar, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\z/
  
  # makes sure all form fields are filled
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :job_title, presence: true
  validates :phone_num, presence: true
  validates :email, presence: true
  validates :description, presence: true
end