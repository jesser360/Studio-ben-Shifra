# Load the Rails application.
require_relative 'application'
Rails.configuration.stripe = {
  :publishable_key => ENV['pk_live_BcXpGXVecQ0CIgsB3vFHOlW4']
}
Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
# Initialize the Rails application.
Rails.application.initialize!
