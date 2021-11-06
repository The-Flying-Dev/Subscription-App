class UsersController < ApplicationController
  before_action :authenticate_user!

  def info
    @subscription = current_user.subscription
    if @subscription.active
      @stripe_customer = Stripe::Customer.retrieve(
        @subscription.stripe_user_id
      )
      @stripe_subscription = @stripe_customer.subscriptions.first
    end

  def charge
    token = params["stripeToken"]
    puts "token #{token}"
    customer = Stripe::Customer.create(
      source: token,
      plan: 'custom',
      email: current_user.email
    )

    current_user.subscription.stripe_user_id = customer.id
    current_user.subscription.active = true
    current_user.subscription.save

    redirect_to users_info_path
  end
end
