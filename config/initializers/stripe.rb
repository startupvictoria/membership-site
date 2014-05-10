require 'stripe'

StartupVictoria.config.stripe_publishable_key = ENV.fetch("STRIPE_PUBLISHABLE_KEY")
StartupVictoria.config.stripe_secret_key = ENV.fetch("STRIPE_SECRET_KEY")

Stripe.api_key = StartupVictoria.config.stripe_secret_key
