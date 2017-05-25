class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :plan
  has_one :profile
  
  attr_accessor :stripe_card_token
  
  #if pro user passes validations, then call Stripe and tell Stripe to set up a subscription upon charging customer's card.
  #Stripe responds back with customer data
  #store customer.id as the customer token
  def save_with_subscription
    customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
    self.stripe_card_token = customer.id
    save!
  end
end
