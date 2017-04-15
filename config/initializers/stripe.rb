raise "Please specify STRIPE_PUBLISHABLE_KEY" unless ENV["STRIPE_PUBLISHABLE_KEY"]
raise "Please specify STRIPE_SECRET_KEY" unless ENV["STRIPE_SECRET_KEY"]
Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
